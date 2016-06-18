class Api::V1::CurrentUserController < ApplicationController
  def show
    binding.pry
    render json: current_user, root: 'user', adapter: :json
  end
end
