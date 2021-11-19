class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings_given, class_name: "Rating", foreign_key: "rating_giver_id", dependent: :destroy
  has_many :ratings_received, class_name: "Rating", foreign_key: "rating_receiver_id", dependent: :destroy

  has_many :listings, dependent: :destroy

  validates :about_me, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
end
