class Customer < ApplicationRecord 
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email, uniqueness: true
  validates_presence_of :address

  has_many :subscriptions
  has_many :teas, through: :subscriptions
end