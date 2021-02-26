class Rehearsal < ApplicationRecord
  belongs_to :organiser, class_name: 'User', foreign_key: 'user_id'
  has_many :roles
  has_many :requests, through: :roles

  validates :date_time, :address, :title, presence: true

  validates :title, length: { maximum: 25, too_long: "25 characters is the maximum allowed" }

  validate :start_in_future

  # Pass this scope an ARRAY of instrument IDs and it returns all the rehearsals which
  # have a vacancy for one of those instruments. Use on index page.
  scope :has_space_for, ->(instrument_arr) { joins(:roles).merge(Role.space_for(instrument_arr)).merge(Role.vacant) }

  private

  def start_in_future
    if date_time < DateTime.now
      errors.add(:start_date_time, "Your rehearsal cannot take place in the past!")
    end
  end
end
