class ImpulsosController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :add_breadcrumbs, except: :index

	def index
		redirect_to Impulso.order("created_at DESC").first
	end

	def show
		@impulso = Impulso.friendly.find params[:id]
		add_breadcrumb @impulso.titulo, @impulso
		@open_graph_meta_data = { 
				title:			@impulso.titulo,
				type:			"article",
				image:			"http://commondatastorage.googleapis.com/hiperativo%2Fuploads%2Fneurotransmissao.jpg",
				url:			request.protocol+request.host_with_port+request.fullpath,
				description: 	Sanitize.clean(@impulso.conteudo),
				audio: @impulso.audio.url,
				site_name: "hiperativo.co",
				locale: "pt_BR"
			}
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
