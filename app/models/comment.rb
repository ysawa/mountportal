class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::DateTimeField
  field :content, type: String
  date_time_field :acted_at
  field :published, type: Mongoid::Boolean, default: true
  index published: 1
  index acted_at: 1
  validates :content, presence: true
end
