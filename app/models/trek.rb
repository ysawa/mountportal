class Trek
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::DateTimeField
  field :name, type: String
  field :published, type: Boolean, default: true
  date_time_field :scheduled_from
  date_time_field :scheduled_to
  belongs_to :creator, class_name: 'User'
  belongs_to :picture, class_name: 'Figure'
  attr_accessible :name, :picture_id, :published, :scheduled_from, :scheduled_to, :scheduled_from_date, :scheduled_to_date, :scheduled_from_time, :scheduled_to_time

  validates :name, presence: true
  has_many :comments

  index published: 1
  index scheduled_from_date: 1
  index scheduled_from_time: 1
  index scheduled_to_date: 1
  index scheduled_to_time: 1

  class << self
    def published
      criteria.where(published: true)
    end

    def unpublished
      criteria.where(:published.ne => true)
    end
  end
end
