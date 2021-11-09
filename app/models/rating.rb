class Rating < ApplicationRecord
    belongs_to :rating_receiver, class_name: "User", foreign_key: "rating_receiver_id"
    belongs_to :rating_giver, class_name: "User", foreign_key: "rating_giver_id"
end
