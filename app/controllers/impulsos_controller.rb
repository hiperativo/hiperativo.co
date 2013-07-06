class ImpulsosController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@impulsos = Impulso.all
	end

	def show
		@impulso = Impulso.find params[:id]
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
		@impulso = Impulso.find params[:id]
	end

	def update
		@impulso = Impulso.find params[:id]
		@impulso.update_attributes! params[:impulso]
		redirect_to @impulso
	end

	def destroy
		Impulso.find(params[:id]).destroy
		redirect_to impulsos_path
	end
end
