class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  validates :date, presence: true
  validates :creator_id, presence: true
end
