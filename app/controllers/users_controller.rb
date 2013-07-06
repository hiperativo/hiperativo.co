class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
	end

	def create
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		@user.update_attributes params[:user]
		# render json: params
		redirect_to action: :index
	end

	def destroy
	end
end
