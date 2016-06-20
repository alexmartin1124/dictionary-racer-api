require_relative '/lib/auth'
class SessionsController < ApplicationController

  skip_before_action :authenticate

  def create
    user = User.find_by(email: auth_params[:email])
    if user.authenticate(auth_params[:password])
      jwt = Auth.issue({user: user.id})
      render json: {jwt: jwt}
    else
      # binding.pry
      render json: {you: 'fucked_up'}
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:username, :email, :password)
  end

end
