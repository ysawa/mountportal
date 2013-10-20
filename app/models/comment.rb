class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::DateTimeField
  field :content, type: String
  date_time_field :acted_at
  field :published, type: Boolean, default: true
  belongs_to :author, class_name: 'User'
  belongs_to :figure
  belongs_to :trek
  belongs_to :parent, class_name: 'Comment'
  has_many :children, inverse_of: :parent, class_name: 'Comment'
  attr_accessible :acted_at, :content, :figure_id, :parent_id, :trek_id
  before_validation :fill_in_acted_at

  index trek_id: 1
  index published: 1
  index acted_at: 1
  validates :content, presence: true

  def fill_in_acted_at
    self.acted_at ||= self.created_at || Time.now
  end
end
