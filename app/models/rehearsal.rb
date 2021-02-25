class Rehearsal < ApplicationRecord
  belongs_to :organiser, class_name: 'User', foreign_key: 'user_id'
  has_many :roles
  has_many :requests, through: :roles
end
