class AddPowerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :power, :integer, default: 0
  end
end
