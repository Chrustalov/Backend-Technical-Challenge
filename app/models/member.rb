class Member < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
end
