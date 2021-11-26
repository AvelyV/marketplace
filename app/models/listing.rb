class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :location

  resourcify

  accepts_nested_attributes_for :location

  has_many :listing_categories, dependent: :destroy
  has_many :categories, through: :listing_categories

  has_one_attached :picture

  validates :title, presence: true, length: { minimum: 2, maximum: 50 }, format: { with: /\A[a-zA-Z\s]+\z/,
                                                                                   message: "only allows letters" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :qty, presence: true, numericality: { greater_than_or_equal_to: 0 }
  

  def to_s
    title
  end
end
