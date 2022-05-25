class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :capacity

  enum visiting_time: {
    '10:00': 0,
    '10:30': 1,
    '11:00': 2,
    '11:30': 3,
    '12:00': 4
  }

  enum reservation_status: {
    visiting: 0,
    visited: 1,
    cancel: 2
  }
end
