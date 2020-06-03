class Sub < ApplicationRecord
  validates :name, presence: true
  has_many :topics, dependent: :destroy
end
