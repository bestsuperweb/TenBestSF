class SubCategory < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
end
