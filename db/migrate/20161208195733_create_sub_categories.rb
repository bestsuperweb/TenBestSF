class CreateSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.text :name
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :sub_categories, [:category_id, :created_at]
  end
end
