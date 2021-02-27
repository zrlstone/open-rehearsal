class Role < ApplicationRecord
  belongs_to :rehearsal
  belongs_to :instrument
  belongs_to :user, optional: true
  has_many :requests, dependent: :destroy

  scope :filled, -> { where.not(user_id: nil) }

  scope :vacant, -> { where(user_id: nil) }

  scope :vacancy_for, ->(instrument_arr) { where(instrument_id: [instrument_arr]).vacant }
end
