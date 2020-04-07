class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true
    has_many :reviews
    has_many :hotels, through: :reviews
end
