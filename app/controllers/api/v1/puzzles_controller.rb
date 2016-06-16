module Api
  module V1
    class PuzzlesController < ApplicationController
      def index
        render json: Puzzle.includes(:entries, :users), include: ["entries", "users"]
      end
    end
  end
end