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

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :number_of_items, presence: true
  validates :visiting_time, presence: true
  validates :reservation_status, presence: true
  validates :capacity_id, presence: true

  validate :date_before_today
  validate :date_current_today
  validate :start_time_not_wednesday
  validate :start_time_not_saturday

  def date_before_today
    errors.add(:start_time, 'は過去の日付は選択できません') if capacity.start_time < Time.zone.today
  end

  def date_current_today
    errors.add(:day, 'は当日は選択できません。予約画面から正しい日付を選択してください') if day < (Date.current + 1)
  end

  def start_time_not_wednesday
    errors.add(:start_time, 'は定休日(水曜日)以外を選択してください') if capacity.start_time.wednesday?
  end

  def start_time_not_saturday
    errors.add(:start_time, 'は定休日(土曜日)以外を選択してください') if capacity.start_time.saturday?
  end
end
