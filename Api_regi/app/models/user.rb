class User < ActiveRecord::Base
    has_many :api
    attr_accessor :remember_token
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save { self.email = email.downcase }
    validates :name,     presence: true, length: { maximum: 50 }
    validates :email,    presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
    validates :password, presence: true, length: { minimum: 6}
    has_secure_password
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end    
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end    
end
