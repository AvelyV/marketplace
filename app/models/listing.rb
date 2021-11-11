class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_one_attached :picture

  validates :title, presence: true, length: {minimum: 2, maximum: 50}, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 50, maximum: 500 }
  validates :qty, presence: true, numericality: { greater_than_or_equal_to: 1 }


end
