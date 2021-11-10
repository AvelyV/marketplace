class Location < ApplicationRecord

    has_many :listings

    validates :state, presence: true
    validates :suburb, presence: true, length: { minimum: 2, maximum: 31 }
    validates :postcode, presence: true, numericality: { equal_to: 4 }
end
