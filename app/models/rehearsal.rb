class Rehearsal < ApplicationRecord
  belongs_to :organiser, class_name: 'User', foreign_key: 'user_id'
  has_many :roles, dependent: :destroy
  has_many :requests, through: :roles
  has_many :attendees, through: :roles, source: :user

  accepts_nested_attributes_for :roles

  validates :date_time, :address, :title, presence: true

  validates :title, length: { maximum: 30, too_long: "30 characters is the maximum allowed" }

  validate :start_in_future

  # Pass this scope an ARRAY of instrument IDs and it returns all the rehearsals which
  # have a vacancy for one of those instruments. Use on index page.
  scope :has_space_for, ->(instrument_arr) { joins(:roles).merge(Role.vacancy_for(instrument_arr)) }

  scope :upcoming, -> { where("date_time > ?", DateTime.now) }
  scope :past, -> { where("date_time < ?", DateTime.now) }

  def organiser_role
    roles.where(user: organiser).first
  end

  # Adding search function to the model
  include PgSearch::Model
  pg_search_scope :search_by_title_and_address,
    against: [:title, :description, :address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  private

  def start_in_future
    if date_time < DateTime.now
      errors.add(:date_time, "Your rehearsal cannot take place in the past!")
    end
  end
end
