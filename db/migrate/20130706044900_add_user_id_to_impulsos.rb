class AddUserIdToImpulsos < ActiveRecord::Migration
  def change
    add_column :impulsos, :user_id, :integer
  end
end
