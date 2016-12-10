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
	end

	def ranking
		category = params[:category].nil? ? 1 : params[:category]
		@category = Category.find(category)
		@companies = Company.where("category = ?", category)		
	end

	def search
		if params[:search_select].nil? or params[:search_select] == ''
			category = nil	
		else
			category = Category.find_by_name(params[:search_select]).id
		end

		if category.nil?
			if params[:search] == '' or params[:search].nil?
				@companies = nil
			else
				@search_str = params[:search]
				@companies = Company.where("name LIKE ?", "%#{params[:search]}%") 
			end
		else
			@companies = Company.where( "name LIKE ? AND category = ?", "%#{params[:search]}%", category)
		end	
	end

	def creat
		@result = ''
		category_names = ['Brunch Place', 'Fashion Events', 'Hotel', 'Travel Agency', 'Craft Breweire']
		(1..5).each do |int|
			category = Category.new(name: category_names[int-1])
			category.save
			(1..5).each do |sint|
				subcategory = SubCategory.new(name: "#{category_names[int-1]} Sub-#{sint}", category_id: int)
				subcategory.save
			end
			(1..5).each do |cint|
				company = Company.new(name: "Friends of Mine#{int}#{cint}", category: int, subcategory: cint, city: "Richmond-#{cint}", share: int*cint, like: (int+1)*10 )
				company.save
			end 
		end		
	end	
end
