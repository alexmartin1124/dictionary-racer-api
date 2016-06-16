module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: User.includes(:puzzles), include: ["puzzles"]
      end
    end
  end
end