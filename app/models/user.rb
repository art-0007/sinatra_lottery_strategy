class User < ActiveRecord::Base
    has_many :board, through: :account
    has_secure_password
end