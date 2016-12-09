class IndexController < ApplicationController
	def home
		if params[:search_select].nil? or params[:search_select] == ''
			category = nil	
		else
			category = Category.find_by_name(params[:search_select]).id
		end

		if category.nil?
			if params[:search] == '' or params[:search].nil?
				@companies = nil
			else
				@companies = Company.where( "name LIKE ?", "%#{params[:search]}%")
			end
		else
			@companies = Company.where( "name LIKE ? AND category = ?", "%#{params[:search]}%", category)
		end		
	end

	def about

	end

	def contact

	end

	def place
		
	end

	def ranking
		
	end

	def creat
		@result = ''
		(1..5).each do |int|
			company = Company.new(name: "company-#{int}", category: int, subcategory: int+1, city: "Toront-#{int}")
			if company.save
				@result += 'success-'
			end
			category = Category.new(name: "category-#{int}")
			if category.save
				@result += 'success-'
			end
			subcategory = SubCategory.new(name: "sub category-#{int}", category_id: int)
			if subcategory.save
				@result += 'success/'
			end
		end
	end
	
end
