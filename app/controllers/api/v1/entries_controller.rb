module Api
  module V1
    class EntriesController < ApplicationController
      def index
        if params[:filter]
          key = params[:filter].keys[0]
          value = params[:filter].values[0]
          value.gsub!(/[^A-Za-z]/, '') if key == 'word'
          entry = Entry.find_by(key => value)
          entry = EntryCreator.create_entry(value) if !entry && key == 'word'
          entry.save
          render json: entry
        else
          render json: Entry.includes(:puzzles), include: ['puzzles']
        end
      end
    end
  end
end
