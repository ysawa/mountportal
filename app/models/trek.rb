class Trek
  include Mongoid::Document
  field :name, type: String
  field :scheduled_from, type: Time
  field :scheduled_to, type: Time
  validates :name, presence: true
end
