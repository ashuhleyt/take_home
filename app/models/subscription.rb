class Subscription < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :tea_id
  validates_presence_of :title
  validates_numericality_of :price
  validates_presence_of :status
  validates_numericality_of :frequency

  belongs_to :customer
  belongs_to :tea
end