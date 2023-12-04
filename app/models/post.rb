class Post < ApplicationRecord
  attr_reader :search_music

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  validates :mood, presence: true
  MOODS = %i[😁Heureux 😔Triste 🥳Joyeux 🥹Emotif 😒Exaspéré 😡Colère 😴Endormi 🤔Pensif 🥶Froid ]
end
