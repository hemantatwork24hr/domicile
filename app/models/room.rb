class Room
  
  include Mongoid::Document
 
  field :name, type: String
  field :type, type: Integer
  field :price, type: Integer
  field :num_beds, type: Integer
  field :availability, type: Boolean
  field :room_floor, type: Integer
  field :room_number, type: Integer
  field :description, type: String

  validates :name,  presence: true, length: { in: 5..10}, uniqueness: true
  validates :type, :room_floor, :num_beds, presence: true, numericality: { only_integer: true, allow_nil: false }
  validates :price, numericality: { only_integer: false, allow_nil: false } 
  validates :availability, inclusion:{ in: %w( 0,1 ) }
end
