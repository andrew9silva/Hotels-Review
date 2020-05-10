class Review < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :hotel, optional: true

    validates :date_visited, :content, :presence => true

end
