class Puzzle < ApplicationRecord
  has_many :user_puzzles
  has_many :users, through: :user_puzzles
  has_many :puzzle_entries
  has_many :entries, through: :puzzle_entries
end