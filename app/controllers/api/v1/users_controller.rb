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
    end
  end
end