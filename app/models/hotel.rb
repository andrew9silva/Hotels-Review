class Hotel < ApplicationRecord
    belongs_to :location, optional: true
    belongs_to :user, optional: true
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    validates :name, :price_level, :amenities, :location, :presence => true

end
