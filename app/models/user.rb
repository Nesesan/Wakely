class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :reactions
  validates :username, uniqueness: true

  def last_posts
    self.posts[0..-1]
  end

  def last_post_day
    self.posts.last
  end
end
