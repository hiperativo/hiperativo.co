class ChangeMensagemFormatToText < ActiveRecord::Migration
  def up
  	change_column :contatos, :mensagem, :text
  end

  def down
  end
end
