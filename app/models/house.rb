class House < ApplicationRecord
  belongs_to :user
  has_many :favourites, dependent: :destroy
  has_many :houses, dependent: :destroy
end
