class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, presence: true
    has_many :reviews
    has_many :hotels, through: :reviews

    def self.from_omniauth(auth_hash)
        user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
        user.username = auth_hash['info']['name']
        user.location = auth_hash['info']['location']
        user.image_url = auth_hash['info']['image']
        user.url = auth_hash['info']['urls']['Google']
        user.save!
        user
      end

    
end
