class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :category
      t.integer :subcategory
      t.string :city
      t.integer :share
      t.integer :like
     
      t.timestamps
    end
  end
end
