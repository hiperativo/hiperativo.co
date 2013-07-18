class AddExtraInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :secret, :string
    add_column :users, :nickname, :string
    add_column :users, :bio, :string
    add_column :users, :image_url, :string
  end
end
