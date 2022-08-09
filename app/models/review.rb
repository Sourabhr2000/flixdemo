class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  # validates :name, presence: true
  validates :comment, length: { minimum: 4 }

  stars = [1, 2, 3, 4, 5]
  validates :stars, inclusion: {in: stars,message: "must shoud be between 1 and 5"}


  def stars_as_percent
    (stars / 5.0) * 100.0
  end
end
