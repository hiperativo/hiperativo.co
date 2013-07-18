class UsersController < ApplicationController
	before_action :authenticate_user!
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
		if current_user.power >= 3 or current_user == @user
			params[:user].delete(:power) unless current_user.power >= 3
			@user.update_attributes params[:user]
			# render json: param
			redirect_to action: :index
		else
			raise "Não autorizado"
		end
	end

	def destroy
		if current_user.power >= 3	
			User.find(params[:id]).destroy
		else
			raise "Não autorizado"
		end
		redirect_to action: :index
	end
end
