class Book < ActiveRecord::Base

  # validation check columns
  validates :isbn, presence: true, uniqueness: true
  validates :name, presence: true
  validates :authors, presence: true
  validates :status, presence: true

  # Relationships
  has_many :reservations

  enum status: [:available, :checkedOut]
end
