class IndexController < ApplicationController
	def home
		if params[:search_select].nil? or params[:search_select] == ''
			category = ''	
		else
			category = Category.find_by_name(params[:search_select]).id
		end

		if category == ''
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
	
end
