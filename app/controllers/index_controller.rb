class IndexController < ApplicationController
	def home
			
	end

	def about

	end

	def contact

	end

	def place
		id = params[:id].nil? ? 1 : params[:id]
		@no = params[:no].nil? ? 1 : params[:no]
		@company = Company.find(id)
		@position =  get_info @company						
	end

	def ranking
		category = params[:category].nil? ? 1 : params[:category]
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
		unless params[:id].nil?
			@company = Company.find(params[:id])
			if @company.share.nil?
				@share = 1 
			else
				@share = @company.share + 1 
			end			
			@company.update( :share => @share )
		end
	end

	def like_up
		unless params[:id].nil?
			@company = Company.find(params[:id])
			if @company.like.nil?
				@like = 1 
			else
				@like = @company.like + 1 
			end
			@company.update( :like => @like )
		end
	end

	def creat
		@result = ''
		category_names = ['Brunch Place', 'Fashion Events', 'Hotel', 'Travel Agency', 'Craft Breweire']
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

	private

	def get_info company
		info = {}
		begin
			url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{company.name}+#{company.city}&key=AIzaSyATURkst6qutoXt_3stX18GMEYoH103bUI"
			result = RestClient.get url
			result_json = JSON.parse result
		rescue Exception => e
			info['lat'] = 37.5556023
			info['lng'] = -77.4627319
			info['img'] = 'place-image.png'
			info['address'] = '1234 Street, Richmond'
		else
			if result_json['results'].nil? or result_json['results'].first.nil?
				info['lat'] = 37.5556023
				info['lng'] = -77.4627319
				info['img'] = 'place-image.png'
				info['address'] = '1234 Street, Richmond'
			else
				info['lat'] = result_json['results'].first['geometry']['location']['lat']
				info['lng'] = result_json['results'].first['geometry']['location']['lng']
				info['address'] = result_json['results'].first['formatted_address']
				photo_reference = result_json['results'].first['photos'].first['photo_reference']
				info['img'] = "https://maps.googleapis.com/maps/api/place/photo?maxheight=400&photoreference=#{photo_reference}&key=AIzaSyATURkst6qutoXt_3stX18GMEYoH103bUI"
			end				
		end
		return info		
	end

end
