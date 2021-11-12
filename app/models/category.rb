class Category < ApplicationRecord

    has_many :listing_categories, dependent: :destroy
    has_many :listings, through: :listing_categories
end
