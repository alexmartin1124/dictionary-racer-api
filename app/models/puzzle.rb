class Puzzle < ApplicationRecord
  has_many :user_puzzles
  has_many :users, through: :user_puzzles
  has_many :puzzle_entries
  has_many :entries, through: :puzzle_entries

  validate :unique_start_end_combo, on: :create

  def unique_start_end_combo
    errors.add(:start_word, "and end word cannot exactly match another puzzle") if Puzzle.find_by(start_word: start_word, end_word: end_word)
  end
end