class Rehearsal < ApplicationRecord
  belongs_to :organiser, class_name: 'User', foreign_key: 'user_id'
  has_many :roles, dependent: :destroy
  has_many :requests, through: :roles
  has_many :attendees, through: :roles, source: :user

  accepts_nested_attributes_for :roles

  validates :date_time, :address, :title, presence: true

  validates :title, length: { maximum: 25, too_long: "25 characters is the maximum allowed" }

  validate :start_in_future

  scope :has_space_for, ->(instrument_arr) { joins(:roles).merge(Role.vacancy_for(instrument_arr)) }
  scope :upcoming, -> { where("date_time > ?", DateTime.now) }
  scope :past, -> { where("date_time < ?", DateTime.now) }
  scope :order_by_pending, -> { left_outer_joins(:requests).merge(Request.pending).group(:id).order('COUNT(requests.id) DESC') }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def organiser_role
    roles.where(user: organiser).first
  end

  def pending_count
    requests.pending.count
  end

  include PgSearch::Model
  pg_search_scope :search_by_title_and_address,
    against: [:title, :description, :address],
    using: {
      tsearch: { prefix: true }
    }

  private

  def start_in_future
    if date_time < DateTime.now
      errors.add(:date_time, "Your rehearsal cannot take place in the past!")
    end
  end
end
