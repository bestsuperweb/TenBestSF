class Company < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :category, presence: true
	validates :city, presence: true
end
