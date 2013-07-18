class Notifications < ActionMailer::Base
	default from: "#{ENV['EMAIL_LOGIN']}@#{ENV['EMAIL_DOMAIN']}"

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#	en.notifications.new_comment.subject
	#
	def new_comment(comentario)
		@conteudo = comentario.conteudo
		mail to: "pedrozath@gmail.com", 
			subject: "Impulso Hiperativo: @#{comentario.user.nickname} comentou no texto #{comentario.impulso.titulo}"
	end
end
