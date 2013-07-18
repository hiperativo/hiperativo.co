class AddImpulsoIdToComentarios < ActiveRecord::Migration
  def change
    add_column :comentarios, :impulso_id, :integer
    remove_column :comentarios, :user_id
    add_column :comentarios, :user_id, :integer
  end
end
