class Request < ApplicationRecord
  belongs_to :role
  belongs_to :user

  def status
    if accepted == true
      'Confirmed'
    elsif accepted == false
      'Rejected'
    elsif role.user == nil
      'Pending'
    end
  end

  scope :accepted, -> { where(accepted: true) }
  scope :rejected, -> { where(accepted: false) }
end
