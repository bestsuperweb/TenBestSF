class AddCompanyToIps < ActiveRecord::Migration[5.0]
  def change
    add_column :ips, :company_id, :integer
    add_column :ips, :share, :integer
    add_column :ips, :like, :integer
  end
end
