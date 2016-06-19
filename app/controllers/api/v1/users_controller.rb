module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.includes(:puzzles), include: ["puzzles"]
      end

      def show
        if params[:id] == "current-user"
          render json: current_user
        else
          render json: User.find(params[:id])
        end
      end

      def create
        user = User.new(username: params[:data][:attributes][:username], email: params[:data][:attributes][:email], password: params[:data][:attributes][:password], password_confirmation: params[:data][:attributes]['password-confirmation'])
        if user.save
          render json: user, status: 200
        else
          render json: ErrorSerializer.serialize(user.errors), status: 422
        end
      end

      private

      def user_params
        params[:data].require(:attributes).permit(:first_name, :last_name, :email, :password, 'password-confirmation')
      end

    end
  end
end
