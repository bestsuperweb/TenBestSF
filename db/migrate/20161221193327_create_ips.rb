class CreateIps < ActiveRecord::Migration[5.0]
  def change
    create_table :ips do |t|
      t.string :address

      t.timestamps
    end
  end
end
