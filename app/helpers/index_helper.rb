module IndexHelper
	def modal_text company
		modal_text = Category.find(company.category).name unless company.category.nil?
		# modal_text = SubCategory.find(company.subcategory).name unless company.subcategory.nil?
		return modal_text
	end

	def position n
		position = {}
		divmod = n.divmod 4
		position[:top] = divmod[1] % 2 != 0 ? divmod[0] * 180  : ( 2 * divmod[0] + 1 ) * 90 
		position[:left] = divmod[1] * 157
		return position
	end

	def search_result_height length
		height = ( ( @companies.length/4 ).ceil + 1 ) * 180
		return height
	end
end
