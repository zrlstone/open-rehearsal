class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills
  has_many :instruments, through: :skills
  has_many :rehearsals, inverse_of: 'organiser'
  has_many :requests
  has_many :roles, through: :requests
end
