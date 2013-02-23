class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :mensagem

      t.timestamps
    end
  end
end
