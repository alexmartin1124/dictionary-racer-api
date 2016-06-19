module Api
  module V1
    class PuzzlesController < ApplicationController
      def index
        render json: Puzzle.includes(:entries, :users), include: ["entries", "users"]
      end

      def create
        start_word = puzzle_params["start-word"]
        end_word = puzzle_params["end-word"]
        entries = [start_word, end_word]
        entries.map! do |word|
          if Entry.find_by(word: word)
            Entry.find_by(word: word)
          else
            EntryCreator.new(word).create_entry
          end
        end
        puzzle = Puzzle.new(start_word: start_word, end_word: end_word)
        entries.each{|entry| puzzle.entries << entry}
        puzzle.users << current_user
        if puzzle.save
          render json: puzzle
        else
          render json: {error: "Invalid puzzle."}
        end
      end

    private

      def puzzle_params
        params[:data].require(:attributes).permit("start-word", "end-word")
      end
    end
  end
end
