class User < ApplicationRecord
    before_create :generate_authentication_token!

    validates :name, presence: true, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      uniqueness: true,
                      format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true,
                         length: { minimum: 6 }
    validates :auth_token, uniqueness: true
    has_secure_password
    # methods
    def generate_authentication_token!
        begin
          self.auth_token = Devise.friendly_token
        end while self.class.exists?(auth_token: auth_token)
      end
end
