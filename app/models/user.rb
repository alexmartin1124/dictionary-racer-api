class User < ApplicationRecord
  has_many :user_puzzles
  has_many :puzzles, through: :user_puzzles
  has_secure_password
end
