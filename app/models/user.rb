class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true
    has_many :reviews
    has_many :hotels, through: :reviews

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.uid = auth.uid
            user.name = auth.info.name
            user.email = auth.info.emailuser.image_url = auth.info.image_url
        end
    end
end
