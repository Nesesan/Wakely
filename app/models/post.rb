class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :reactions
  validates :mood, presence: true
  MOODS = %i[]
end
