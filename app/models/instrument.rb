class Instrument < ApplicationRecord
  validates :name, presence: true
  has_one_attached :photo
end
