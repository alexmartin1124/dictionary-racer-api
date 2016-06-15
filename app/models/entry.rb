class Entry < ApplicationRecord
  has_many :puzzle_entries
  has_many :puzzles, through: :puzzle_entries

end
