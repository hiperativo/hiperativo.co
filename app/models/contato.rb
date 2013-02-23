class Contato < ActiveRecord::Base
  attr_accessible :email, :mensagem, :name, :subject, :telefone
end
