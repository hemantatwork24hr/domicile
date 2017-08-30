class Booking

  include Mongoid::Document
  field :check_in, type: Date
  field :check_out, type: Date
  field :adults, type: Integer
  field :children, type: Integer
  field :room_id, type: Integer
  field :customer_id, type: Integer

  belongs_to :room
  belongs_to :customer

  has_many :room_types
end
