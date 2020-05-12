class Location < ApplicationRecord
    has_many :hotels
    scope :ordered_by_name, -> { order(name: :asc) } 

    validates :name, :presence => true
end
