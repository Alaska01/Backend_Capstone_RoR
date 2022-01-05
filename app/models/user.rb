class User < ApplicationRecord
  has_secure_password
  has_many :houses
  has_many :favourites, dependent: :destroy
  has_many :favourite_houses, through: :favourites, source: :house
end
