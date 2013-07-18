class Comentario < ActiveRecord::Base
	attr_accessible :conteudo, :user_id, :impulso_id
	validates :conteudo, presence: true
	validates :user_id, presence: true
	validates :impulso_id, presence: true
	
	belongs_to :impulso
	belongs_to :user
end
