class Category < ApplicationRecord
	has_many :sub_categories, dependent: :destroy
	validates :name, presence: true, uniqueness: true	
end
