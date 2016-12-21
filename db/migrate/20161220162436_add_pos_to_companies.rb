class AddPosToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :lat, :real
    add_column :companies, :lng, :real
    add_column :companies, :photo, :string
  end
end
