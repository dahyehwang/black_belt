class UsersController < ApplicationController
	# before_action :require_login, except: [:main, :create]
	# before_action :require_correct_user, only: [:main, :show, :info]
	def main
	end

	def create
		@user = User.create(user_params)
		if @user.valid?
			session[:user_id] = @user.id
			redirect_to "/bright_ideas"
  	else	
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'
  	end
	end

	def show
		@posts = Post.all
		@join = Post.joins(:user).select("*")
	end

	def info
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	end
	def group_params
		params.require(:post).permit(:idea, :user_id)
	end
end