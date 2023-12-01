class Post < ApplicationRecord
  attr_reader :search_music

  belongs_to :user
  has_many :comments
  has_many :reactions
  validates :mood, presence: true
  MOODS = %i[😁 😔 🥳].freeze
end
