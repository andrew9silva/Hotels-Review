class Hotel < ApplicationRecord
    belongs_to :location, optional: true
    belongs_to :user, optional: true
    has_many :reviews
    has_many :users, through: :reviews

end
