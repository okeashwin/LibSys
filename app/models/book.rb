class Book < ActiveRecord::Base
  enum status: [:available, :checkedOut]
end
