class IndexController < ApplicationController
	def home
		@companies = Company.where( "category LIKE ? ", "%#{params[:search]}%").order("name DESC")
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
