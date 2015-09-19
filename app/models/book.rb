class Book < ActiveRecord::Base
  has_many :reservations
  enum status: [:available, :checkedOut]
end
