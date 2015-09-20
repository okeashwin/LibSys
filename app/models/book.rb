class Book < ActiveRecord::Base

  validates :isbn, presence: true, uniqueness: true
  has_many :reservations
  enum status: [:available, :checkedOut]
end
