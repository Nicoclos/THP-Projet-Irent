class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :vendor, :boolean
    add_column :users, :age, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :image_url, :string
    add_column :users, :bio, :text
  end
end
