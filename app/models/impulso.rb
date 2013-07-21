class Impulso < ActiveRecord::Base
	extend FriendlyId
	friendly_id :titulo, use: :slugged
	attr_accessible :titulo, :assunto, :conteudo, :user_id,
	:audio, :remove_audio, :audio_cache, :neurotransmissao
	belongs_to :user
	has_many :comentarios

	def should_generate_new_friendly_id?
		true
	end

	mount_uploader :audio, AudioUploader

	validates :titulo, presence: true
	validates :assunto, presence: true
	validates :conteudo, presence: true

end
