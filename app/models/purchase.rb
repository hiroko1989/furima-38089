class Purchase < ApplicationRecord
  belongs_to :user

  belongs_to :item
  #2-3

  has_one :address
end

#2-1

