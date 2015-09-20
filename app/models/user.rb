class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  # validation check columns
  validates :email, presence: true, uniqueness: true
  has_many :reservations
  IS_ADMIN = 1<<0
  IS_MEMBER = 1<<1


end
