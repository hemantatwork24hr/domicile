class Booking

  include Mongoid::Document
  field :check_in, type: Date
  field :check_out, type: Date
  field :adults, type: Integer
  field :children, type: Integer
  field :room_ids, type: Integer
  field :customer_id, type: Integer

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :adults, presence: true, numericality: { only_integer: true, allow_nil: false }
  validates :children, presence: true, numericality: { only_integer: true, allow_nil: false }

  belongs_to :customer

  has_many :room_types
end
