class PagesController < ApplicationController
  def index
  end

  def envio
  	@contato = Contato.new params[:contato]
  	UserMailer.contact_mail(@contato).deliver
  	@contato.save
  	redirect_to "/"
  end
end
