class Task < ApplicationRecord
  belongs_to :member

  STATUSES = [:incomplete, :complete]
  STATUSE_ACTIVE = [:complete]
end
