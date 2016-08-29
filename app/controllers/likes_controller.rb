class LikesController < ApplicationController
	def create
		if Like.find_by_user_id_and_post_id(current_user.id, params[:post_id])
		# current_user.likes.create(post: Post.find(params[:post_id]))
		 flash[:alert] = "You already like this post."
		else
			Like.create(user_id: current_user.id, post_id: params[:post_id])
		end
	  redirect_to '/bright_ideas'
	end

	def destroy
  	Like.find_by_user_id_and_post_id(current_user.id, params[:post_id]).destroy
  	redirect_to '/bright_ideas'
  end
end