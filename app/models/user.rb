class User < ActiveRecord::Base
  has_many :reservations

  IS_ADMIN = 1<<0
  IS_MEMBER = 1<<1
end
