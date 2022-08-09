class Movie < ApplicationRecord
  def flop?
    total_gross.blank? || total_gross < 225_000_000
  end
  # def self.released
  #   where("released_on < ?", Time.now).order("released_on desc")
  # end

  validates :title, :released_on, :duration, presence: true, uniqueness: true
  validates :description, length: {minimum: 25}
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, format: {with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"}

  ratings = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion: { in: ratings }


  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user

  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  def average_stars
    reviews.average(:stars) || 0.0
  end

  scope :released, -> { where("released_on < ?", Time.now).order("released_on desc") }
  scope :upcoming, -> { where("released_on > ?", Time.now).order("released_on asc") }
  

  def to_param
    slug
  end
  
  before_save :set_slug
  private
  def set_slug
    self.slug = title.parameterize
  end

  
end