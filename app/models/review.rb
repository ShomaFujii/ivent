class Review < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :score,presence: true 

end
