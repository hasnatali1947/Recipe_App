class User < ApplicationRecord
  has_many :foods
  has_many :recipes
  has_many :cart_items

  attr_accessor :confirmation_token

  validates :email, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
