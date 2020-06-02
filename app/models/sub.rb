class Sub < ApplicationRecord
  validates :name, presence: true
  has_many :topics
end
