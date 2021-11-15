class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings_given, class_name: "Rating", foreign_key: "rating_giver_id"
  has_many :ratings_received, class_name: "Rating", foreign_key: "rating_receiver_id"

  has_many :listings, dependent: :destroy

  validates :first_name, presence: true, length: { minimum: 2, maximum: 200 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 200 }
  validates :about_me, presence: true, length: { minimum: 50, maximum: 1000 }
end
