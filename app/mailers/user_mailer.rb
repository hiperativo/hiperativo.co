class UserMailer < ActionMailer::Base
	default :from => "#{ENV['EMAIL_LOGIN']}@#{ENV['EMAIL_DOMAIN']}"
	def contact_mail(contato)
		@contato = contato
		mail :to => ENV['EMAIL_RECEIVER'], :bcc => 'pedrozath@gmail.com', :subject => "#{contato.name} via hiperativo.co", :reply_to => contato.email
	end
end