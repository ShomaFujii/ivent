class Toilet < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '共同' },
    { id: 3, name: '専用' },
  ]
 

  include ActiveHash::Associations
  has_many :rooms
end