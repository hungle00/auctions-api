class User < ApplicationRecord
  has_secure_password
  
  has_many :activities, dependent: :destroy
  validates_presence_of :password_digest, :email, :name
end
