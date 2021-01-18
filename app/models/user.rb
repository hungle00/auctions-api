class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  validates_presence_of :password, :email
end
