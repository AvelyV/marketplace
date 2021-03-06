class Rating < ApplicationRecord
  belongs_to :rating_receiver, class_name: "User", foreign_key: "rating_receiver_id"
  belongs_to :rating_giver, class_name: "User", foreign_key: "rating_giver_id"

  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 11 }
  validates :comment, length: { minimum: 0, maximum: 500 }
  validates :rating_receiver_id, presence: true
  validates :rating_giver_id, presence: true
  validates :rating_receiver_id, uniqueness: { scope: :rating_giver_id }
end
