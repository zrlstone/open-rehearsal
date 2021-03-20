class Request < ApplicationRecord
  belongs_to :role
  belongs_to :user

  def status
    if accepted == true
      'confirmed'
    elsif accepted == false
      'rejected'
    elsif role.user == nil
      'pending'
    end
  end

  scope :accepted, -> { where(accepted: true) }
  scope :rejected, -> { where(accepted: false) }
end
