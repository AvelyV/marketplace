class Location < ApplicationRecord

    has_many :listings

    validates :state, presence: true
    validates :suburb, presence: true, length: { minimum: 2, maximum: 31 }, format: { with: /\A[a-zA-Z\s]+\z/,
               message: "only allows letters" }
    validates :postcode, presence: true, numericality: true, length: {minimum:4, maximum:4}

    def to_s
        "#{self.suburb}" + ", " + "#{self.state}"
    end
end
