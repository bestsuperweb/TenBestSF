class IndexController < ApplicationController
	def home
			
	end

	def about

	end

	def contact

	end

	def place
		@no = params[:company].nil? ? 1 : Company.find_by_name(params[:company]).id
		@company = Company.find(@no)
		@position =  get_info @company					
	end

	def ranking
		category = params[:category].nil? ? 1 : Category.find_by_name(params[:category]).id
		@category = Category.find(category)
		@companies = Company.where("category = ?", category).order('id ASC')
		@positions = []
		@companies.each do |company|
			@positions << get_info(company)
		end			
	end

	def search		
		if params[:search_select].nil? or params[:search_select] == ''
			@category = nil	
		else
			@category = params[:search_select]
		end

		if @category.nil?
			if params[:search] == '' or params[:search].nil?
				@companies = nil
			else
				@search_str = params[:search]
				@companies = Company.where("name LIKE ?", "%#{params[:search]}%") if Rails.env.development?
				@companies = Company.where("name ILIKE ?", "%#{params[:search]}%") if Rails.env.production? 
			end
		else
			@search_str = params[:search]
			@companies = Company.where( "name LIKE ? AND category = ?", "%#{params[:search]}%", @category)if Rails.env.development?
			@companies = Company.where( "name ILIKE ? AND category = ?", "%#{params[:search]}%", @category)if Rails.env.production?
		end
		if params[:limit].nil?
			if @companies.to_a.length > 8
				@companies = @companies.to_a.slice(0, 8)
			end
		end
		@limit = params[:limit]
	end

	def share_up
		company = Company.find(params[:id]) unless params[:id].nil?
		ip = Ip.where( "address = ? AND company = ?", get_ip, params[:id] )
		if ip.nil? 		
			if company.share.nil?
				@share = 1 
			else
				@share = company.share + 1 
			end			
			company.update( :share => @share )			
			ip = Ip.new(:address => get_ip, :company_id => params[:id], :share => 1 )
			ip.save
		else
			if ip.share.nil?
				@share = company.share + 1
				company.update( :share => @share )				
				ip.update( :share => 1)
			else
				@share = company.share
			end
		end
	end

	def like_up
		company = Company.find(params[:id]) unless params[:id].nil?
		ip = Ip.where( "address = ? AND company = ?", get_ip, params[:id] )
		if ip.nil?			
			if company.like.nil?
				@like = 1 
			else
				@like = company.like + 1 
			end			
			company.update( :like => @like )			
			ip = Ip.new(:address => get_ip, :company_id => params[:id], :like => 1 )
			ip.save
		else
			if ip.like.nil?
				@like = company.like + 1
				company.update( :like => @like )
				ip.update( :like => 1)
			else
				@like = company.like
			end
			
		end
	end

	def creat
		@result = ''
		category_names = ['Brunch Place', 'Fashion Event', 'Hotel', 'Travel Agency', 'Craft Brewery']
		(1..5).each do |int|
			category = Category.new(name: category_names[int-1])
			category.save
			(6..8).each do |sint|
				subcategory = SubCategory.new(name: "Sub #{category_names[int-1]} #{sint}", category_id: int)
				if subcategory.save
					@result = 'Success!'
				end
			end			
		end		
	end

end
