class Perishable < ApplicationRecord
  attr_accessor :days_to_expiration

  after_initialize :set_start_date, :set_days_to_expiration
  before_validation :set_expiration_date, if: -> { days_to_expiration.present? }

  validates :name, presence: true, uniqueness: true
  validates :expiration_date, presence: true

  scope :about_to_expire, -> { where('expiration_date between ? and ?', Date.current, 3.days.from_now).order(:expiration_date => :asc) }
  scope :soon_to_expire, -> { where('expiration_date between ? and ?', 3.days.from_now, 7.days.from_now).order(:expiration_date => :asc) }
  scope :expired, -> { where('expiration_date <= ?', Date.current).order(:expiration_date => :asc) }
  scope :fresh, -> { where('expiration_date >= ?', 7.days.from_now).order(:expiration_date => :asc) }

  private

    def set_start_date
      self.start_date ||= Date.current
    end

    def set_days_to_expiration
      self.days_to_expiration ||= (expiration_date.to_date - Date.current).to_i if expiration_date.present?
    end

    def set_expiration_date
      self.expiration_date = Date.current + days_to_expiration.days
    end
end
