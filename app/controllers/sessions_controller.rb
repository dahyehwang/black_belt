class SessionsController < ApplicationController
	def login
		@email = user_params[:email]
		@password = user_params[:password]
		@user = User.find_by_email(@email)
		if @user.authenticate(@password)
			session[:user_id] = @user[:id]
			redirect_to "/bright_ideas"		
		else
			flash[:errors] = ['Invalid']
			redirect_to '/'
		end 
	end

	def logout
		session[:user_id] = nil
    redirect_to '/'
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end