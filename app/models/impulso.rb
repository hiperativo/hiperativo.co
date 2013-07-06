class Impulso < ActiveRecord::Base
	attr_accessible :titulo, :assunto, :conteudo
	belongs_to :user
	validates :titulo, presence: true
	validates :assunto, presence: true
	validates :conteudo, presence: true
end
