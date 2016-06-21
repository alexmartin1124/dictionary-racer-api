class Entry < ApplicationRecord
  has_many :puzzle_entries
  has_many :puzzles, through: :puzzle_entries
  before_create :remove_weird_characters

    def remove_weird_characters
      self.definition.slice!(0)
      self.definition = definition.gsub(' :', '; ')
    end
end
