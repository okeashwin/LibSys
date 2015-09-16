class Book < ActiveRecord::Base
  has_one :reservation
end
