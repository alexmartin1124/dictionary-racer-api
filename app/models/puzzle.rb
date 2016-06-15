class Puzzle < ApplicationRecord
  has_many :user_puzzles
  has_many :users, through: :user_puzzles
end