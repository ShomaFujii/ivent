class AirConditioner < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '設備' },
    { id: 3, name: 'なし' },
  ]
 

  include ActiveHash::Associations
  has_many :rooms
end
