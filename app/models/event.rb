class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  validates :date, presence: true
  validates :creator_id, presence: true

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date >= ?", Time.now) }

  def past?
    date < Time.now
  end

  def future?
    date >= Time.now
  end
end
