class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :avatar
  has_many :puzzles
end