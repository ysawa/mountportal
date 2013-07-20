class Trek
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::DateTimeField
  field :name, type: String
  date_time_field :scheduled_from
  date_time_field :scheduled_to
  validates :name, presence: true
end
