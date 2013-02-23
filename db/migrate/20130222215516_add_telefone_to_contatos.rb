class AddTelefoneToContatos < ActiveRecord::Migration
  def change
    add_column :contatos, :telefone, :string
  end
end
