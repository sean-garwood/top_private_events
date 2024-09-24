class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :sitters, through: :attendances, source: :user
end
