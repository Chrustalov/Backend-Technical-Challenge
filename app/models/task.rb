class Task < ApplicationRecord
  belongs_to :member

  validates :name, presence: true, length: { minimum: 4 }
  validates :status, presence: true

  STATUSES = [:incomplete, :complete]
  STATUSE_ACTIVE = [:complete]
end
