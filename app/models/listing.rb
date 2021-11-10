class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :title, presence: true, length: {minimum: 2, maximum: 50}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
