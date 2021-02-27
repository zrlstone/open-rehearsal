class Role < ApplicationRecord
  belongs_to :rehearsal
  belongs_to :instrument
  has_many :requests, dependent: :destroy

  # use on rehearsal show page to show confirmed attendees
  scope :filled, -> { joins(:requests).merge(Request.confirmed) }

  # use on rehearsal show page to display unfilled Roles
  scope :vacant, -> { where.not(id: self.joins(:requests).merge(Request.confirmed)) }

  scope :space_for, ->(instrument_arr) { where(instrument_id: [instrument_arr]).vacant }
end
