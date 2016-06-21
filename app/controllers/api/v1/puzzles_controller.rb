module Api
  module V1
    class PuzzlesController < ApplicationController
      def index
        render json: Puzzle.includes(:entries, :users), include: ["entries", "users"]
      end

      def create
        start_word = puzzle_params["start-word"]
        end_word = puzzle_params["end-word"]
        puzzle = Puzzle.new(start_word: start_word, end_word: end_word)
        [start_word, end_word].each do |word| 
          word.gsub!(/[^A-Za-z]/, '')
          puzzle.entries << (Entry.find_by(word: word) || EntryCreator.create_entry(word))
        end
        puzzle.users << current_user
        render json: puzzle if puzzle.save
      end

      def update
        puzzle = Puzzle.find(params[:id])
        puzzle.best_path = params["data"]["attributes"]["best-path"]
        if puzzle.best_path.count <= 5
          puzzle.difficulty = 'easy'
        elsif puzzle.best_path.count <= 10
          puzzle.difficulty = 'medium'
        else
          puzzle.difficulty = 'hard'
        end
        render json: puzzle if puzzle.save  
      end

    private

      def puzzle_params
        params[:data].require(:attributes).permit("start-word", "end-word")
      end
    end
  end
end