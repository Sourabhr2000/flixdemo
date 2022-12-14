class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  validates :name,:password, presence: true
  validates :email, format: { with: /\S+@\S+/ }
  validates :email, presence: true,format: { with: /\S+@\S+/ },uniqueness: { case_sensitive: false }
                  
                  
end
