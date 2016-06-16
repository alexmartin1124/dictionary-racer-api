class EntrySerializer < ActiveModel::Serializer
  attributes :id, :word, :definition
  has_many :puzzles
end
