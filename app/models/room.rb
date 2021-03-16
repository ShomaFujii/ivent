class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments,dependent: :destroy

  geocoded_by :address
  before_validation :geocode

  def self.search(search)
    if search != ""
      Room.where('address LIKE(?) OR station LIKE(?)', "%#{search}%", "%#{search}%")
    
    else
      Room.all
    end
  end

  with_options presence: true do
    validates :address
    validates :station
    validates :image
    validates :discribe
    validates :date
    validates :price,:deposit,numericality: { greater_than:999 , less_than: 1000001},format:{with: /\A[0-9]+\z/}
    if :phone_number.present?
      validates :phone_number, format: {with: /\A\d{,11}\z/, message: "is invalid. without hyphen(-)"}
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pet
  belongs_to :airConditioner
  belongs_to :toilet
  belongs_to :bathroom
  belongs_to :kitchen

  validates :pet_id,:air_conditioner_id,:toilet_id,:bathroom_id,:kitchen_id, numericality: { other_than: 1 }



end
