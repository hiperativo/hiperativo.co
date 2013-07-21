class NeurotransmissionsController < ApplicationController
	def index
		@impulsos = Impulso.where(neurotransmissao: true)
	end

	def show
		@impulso = Impulso.friendly.find params[:id]
		redirect_to @impulso.audio_url
	end
end
