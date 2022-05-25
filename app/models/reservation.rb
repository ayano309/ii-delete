class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :capacity
end
