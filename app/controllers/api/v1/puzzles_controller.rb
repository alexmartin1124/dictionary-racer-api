module Api
  module V1
    class PuzzlesController < ApplicationController
      def index
        render json: Puzzle.includes(:entries, :users), include: ["entries", "users"]
      end

      def update
        binding.pry
      end
    end
  end
end