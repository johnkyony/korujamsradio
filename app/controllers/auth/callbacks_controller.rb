class Auth::CallbacksController < ApplicationController
  def facebook 
   
    user = User.create_from_omniauth(omniauth_params )
    if user.persisted?
      sign_in(:user, user)
      redirect_to root_path
    else
      redirect_to :failure
    end
    
  end
  
  def failure
    redirect_to new_user_registration_path
  end
  
  private 
  def omniauth_params
    request.env["omniauth.auth"]
  end
end