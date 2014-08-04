class SessionsController < ApplicationController
	def new
		
	end

	def create
		 user = User.find_by(email: params[:session][:email].downcase)
		 if user && user.authenticate(params[:session][:password])
		# 	#sign in the user and redirect to the user's show page.
		 	sign_in user
		 	redirect_back_or user
		 else
		# 	#Create an error message and re-render the signin form.
		 	flash.now[:error] = "Invalid email/password combination"
		 	render 'new'
		 end

		 #this is the 'form_tag' version, which gave me trouble.
		 # update 7.16.14 working fine now!?!
		  
		# user = User.find_by_email(params[:email])	
		# if user && user.authenticate(params[:password])
		# 	session[:user_id] = user.id
		# 	sign_in user
		# 	#flash[:success] = "Signed in!"
		# 	redirect_to user
		# else
		# 	#flash.now.alert = "Invalid email or password"
		# 	flash.now[:error] = "Invalid" 
		# 	render 'new'
		# end
	end

	def destroy
		sign_out
		redirect_to root_url
		#session[:user_id] = nil
		#redirect_to root_url, :notice => "Logged out!"
	end
end
