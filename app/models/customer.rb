class Customer
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String
  field :email, type: String
  field :adhaar_id, type: String

  has_many :bookings
  has_many :rooms
  has_many :room_types
end
