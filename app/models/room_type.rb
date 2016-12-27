class RoomType

  include Mongoid::Document

  field :name, type: String
  field :capacity, type: String
  field :cost, type: String
  field :a_c_cost, type: String

  validates :name, :capacity, :cost, :a_c_cost, presence: true

end
