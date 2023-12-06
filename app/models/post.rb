class Post < ApplicationRecord
  attr_reader :search_music
  scope :followed, -> { where(followed: true) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  validates :mood, presence: true
  MOODS = %i[😁Heureux 😔Triste 🥳Joyeux 🥹Emotif 😒Exaspéré 😡Colère 😴Endormi 🤔Pensif 🥶Froid ]

  def best_reactions
    self.reactions.order(count: :desc)
  end
end
