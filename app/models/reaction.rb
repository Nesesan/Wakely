class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_count
    self.count += 1
    self.save!
  end

  def current_user?(current_user)
    self.user == current_user
  end
end
