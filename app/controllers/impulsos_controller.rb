class ImpulsosController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :add_breadcrumbs, except: :index

	def index
		@impulsos = Impulso.order("created_at DESC")
	end

	def show
		@impulso = Impulso.friendly.find params[:id]
		add_breadcrumb @impulso.titulo, @impulso
	end

	def new
		@impulso = Impulso.new
	end

	def create
		@impulso = current_user.impulsos.create params[:impulso]
		if @impulso.valid?
			@impulso.save
			redirect_to action: :show, id: @impulso.id
		else
			render action: :new
		end
	end

	def edit
		@impulso = Impulso.friendly.find params[:id]
	end

	def update
		@impulso = Impulso.friendly.find params[:id]
		@impulso.update_attributes! params[:impulso]
		redirect_to @impulso
	end

	def destroy
		Impulso.friendly.find(params[:id]).destroy
		redirect_to impulsos_path
	end
	
	protected

	def add_breadcrumbs
		add_breadcrumb "todos os impulsos", root_path
	end
end
