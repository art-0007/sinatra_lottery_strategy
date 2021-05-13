class User < ActiveRecord::Base
    has_many :boards
    has_secure_password
    # validates :email, uniqueness: true
    # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, length: {:within => 6..40}, on: :create
    # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end