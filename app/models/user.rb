class User < ApplicationRecord
    has_secure_password
    has_many :houses
    has_many :favourites
    has_many :favourites, dependent: :destroy
    has_many :houses, dependent: :destroy
end
