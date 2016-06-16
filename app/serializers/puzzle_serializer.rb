class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :start_word, :end_word, :difficulty, :best_path
  has_many :users
  has_many :entries
end
