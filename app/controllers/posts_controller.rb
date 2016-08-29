class PostsController < ApplicationController
	def create
		@post = Post.create(idea: params[:idea], user_id: params[:user_id])
		redirect_to "/bright_ideas"
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy if @post.user == current_user
		redirect_to "/bright_ideas"
	end

	private
	def user_params
		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	end
	def group_params
		params.require(:post).permit(:idea, :user_id)
	end
end