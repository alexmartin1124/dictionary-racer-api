module Api
  module V1
    class EntriesController < ApplicationController
      def index
        render json: Entry.includes(:puzzles), include: ['puzzles']
      end
    end
  end
end