module Api
  module V1
    class EntriesController < ApplicationController
      def index
        if params[:filter]
          key = params[:filter].keys[0]
          value = params[:filter].values[0]
          render json: Entry.find_by(key => value)
        else
          render json: Entry.includes(:puzzles), include: ['puzzles']
        end
      end
    end
  end
end
