class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  validates :date, presence: true
  validates :creator_id, presence: true

  # two class methods: self.past, self.future
  def self.past
    where("date < ?", Time.now)
  end

  def self.future
    where("date >= ?", Time.now)
  end
end
