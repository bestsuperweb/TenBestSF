module IndexHelper
	
	def modal_text company
		modal_text = Category.find(company.category).name unless company.category.nil?
		modal_text = SubCategory.find(company.subcategory).name unless company.subcategory.nil?
		return modal_text
	end

	def position ( n, m )
		position = {}
		divmod = n.divmod m
		position[:top] = divmod[1] % 2 != 0 ? divmod[0] * 270  : ( 2 * divmod[0] + 1 ) * 135 
		position[:left] = divmod[1] * 235.5
		return position
	end

	def search_result_height length
		height = ( ( @companies.length/4 ).ceil + 1 ) * 270
		return height
	end

	def set_title title
		if title.length > 17
			new_title = title[0..14] + '...' 
		else
			new_title = title 
		end		
		return new_title
	end

	def url_code url
		code_url = url.gsub(/\s+/, "-")
		code_url = code_url.downcase!
		return code_url		
	end

end
