class AddSlugToImpulsos < ActiveRecord::Migration
  def change
    add_column :impulsos, :slug, :string, unique: true
  end
end
