class Room
  
  include Mongoid::Document
 
  field :room_number, type: String
  field :room_type_id, type: String
  field :availability, type: Boolean
  field :room_floor, type: Integer

  validates :room_number,  presence: true, uniqueness: true
  validates :room_type_id, :room_floor, presence: true
  validates :room_floor, numericality: { only_integer: true, allow_nil: false }

  belongs_to :room_type

  has_many  :customers
end
