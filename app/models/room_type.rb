class RoomType

  include Mongoid::Document

  field :name, type: String
  field :price, type: Float
  field :number_of_beds, type: Integer
  field :ac, type: Boolean
  field :description, type: String

  validates :name, presence: true, length: { in: 5..10}, uniqueness: true
  validates :price, presence: true, numericality: { allow_nil: false}
  validates :number_of_beds, presence: true, numericality:{ only_integer: true, allow_nil: false}
  validates :description, presence: true

  has_many :rooms, dependent: :destroy

end
