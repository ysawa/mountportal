class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::DateTimeField
  field :content, type: String
  date_time_field :acted_at
  field :published, type: Mongoid::Boolean, default: true
  belongs_to :author, class_name: 'User'
  belongs_to :trek

  index trek_id: 1
  index published: 1
  index acted_at: 1
  validates :content, presence: true
end
