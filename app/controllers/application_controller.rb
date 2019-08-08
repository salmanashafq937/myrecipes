class ApplicationController < ActionController::Base

	def current_chef
		@current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
	end


	helper_method :current_chef, :logged_in?

	def logged_in?
		!!current_chef
	end

	def require_user
		if !logged_in?
			flash[:danger] = "You must be Logged in to perform that action"
			redirect_to root_path
			
		end
	end

end
