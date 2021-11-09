class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ratings_given, class_name: "Rating", foreign_key: "rating_giver_id"
  has_many :ratings_received, class_name: "Rating", foreign_key: "rating_receiver_id"
end
