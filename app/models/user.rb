class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true
    has_many :reviews
    has_many :hotels, through: :reviews

    def self.find_or_create_from_auth_hash(auth)
      where(uid: auth.uid).first_or_initialize.tap do |user|
        
        user.uid = auth.info.uid
        user.username = auth.info.email
        user.password_digest = auth.info.password
    
        user.save
      end
    end
end
