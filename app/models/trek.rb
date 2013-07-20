class Trek
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::DateTimeField
  field :name, type: String
  date_time_field :scheduled_from
  date_time_field :scheduled_to
  belongs_to :creator, class_name: 'User'
  validates :name, presence: true

  index scheduled_from_date: 1
  index scheduled_from_time: 1
  index scheduled_to_date: 1
  index scheduled_to_time: 1
end
