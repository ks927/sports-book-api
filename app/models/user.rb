class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      uniqueness: true,
                      format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true,
                         length: { minimum: 6 }
end
