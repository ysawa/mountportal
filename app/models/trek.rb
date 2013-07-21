class Trek
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::DateTimeField
  field :name, type: String
  field :published, type: Boolean
  date_time_field :scheduled_from
  date_time_field :scheduled_to
  belongs_to :creator, class_name: 'User'
  validates :name, presence: true
  attr_protected :creator_id

  index published: 1
  index scheduled_from_date: 1
  index scheduled_from_time: 1
  index scheduled_to_date: 1
  index scheduled_to_time: 1

  class << self
    def published
      critreia.where(published: true)
    end

    def unpublished
      critreia.where(published: true)
    end
  end
end
