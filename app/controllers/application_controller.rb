class ApplicationController < ActionController::Base

  def current_user
  User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
      #we can use current_user through all of our inherited controllers to reference the user

  def require_login
  redirect_to '/sessions/new' if session[:user_id] == nil
  end


  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

    # By adding this method in our ApplicationController, all of our controllers will 
    # have access to this method (since all controllers inherit from this controller). 
    # By specifiying helper_method :current_user, we make this method available in all 
    # of our view files as well. We can display 'Log Out' only when a user is logged in 
    # by having this in our layout: