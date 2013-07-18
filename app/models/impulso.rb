class Impulso < ActiveRecord::Base
	extend FriendlyId
	friendly_id :titulo, use: :slugged
	attr_accessible :titulo, :assunto, :conteudo, :user_id
	belongs_to :user
	has_many :comentarios

	validates :titulo, presence: true
	validates :assunto, presence: true
	validates :conteudo, presence: true

end
