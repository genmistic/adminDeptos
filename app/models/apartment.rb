class Apartment < ApplicationRecord
  belongs_to :building
  validates(:puerta, presence: true, numericality: true)
end
