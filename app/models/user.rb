class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills, dependent: :destroy
  has_many :instruments, through: :skills
  has_many :rehearsals, inverse_of: 'organiser', dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :roles

  validates :username, presence: true
  validates_uniqueness_of :username

  validates :username, length: { in: 6..20 }

  def upcoming_rehearsals
    Rehearsal.joins(:roles).upcoming.where(roles: { user_id: self.id })
  end
end
