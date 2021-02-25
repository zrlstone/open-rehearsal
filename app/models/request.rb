class Request < ApplicationRecord
  belongs_to :role
  belongs_to :user

  scope :confirmed, -> { where(confirmed: true) } # use on myrequests page
end
