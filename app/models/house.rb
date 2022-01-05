class House < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :houses, dependent: :destroy
end
