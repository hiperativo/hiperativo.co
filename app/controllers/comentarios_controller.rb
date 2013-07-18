class ComentariosController < ApplicationController
	before_action :authenticate_user!
	def create
		@impulso = Impulso.friendly.find params[:impulso_id]
		@comentario = @impulso.comentarios.create(params[:comentario])
		render @impulso.comentarios.order("created_at")
		Notifications.new_comment(@comentario).deliver
	end

	def destroy
		@comentario = Comentario.find params[:id]
		@comentario.destroy if (@comentario.user == current_user or current_user.power >= 2)
		render @comentario.impulso.comentarios.order("created_at")
	end
end
