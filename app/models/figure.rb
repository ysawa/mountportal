class Figure
  include Mongoid::Document
  include Mongoid::Timestamps
  field :caption, type: String
  field :content_size, type: Integer, default: 0
  field :content_type, type: String, default: ''
  belongs_to :user
  mount_uploader :file, FigureFileUploader
  mount_uploader :image, FigureImageUploader
  IMAGE_CONTENT_TYPES = %w(image/png image/bmp image/gif image/jpeg image/svg+xml)

  def build_data
    data = {
      'id' => self.id.to_s
    }
    if content_image?
      data['image_url'] = self.image.url
      data['small_image_url'] = self.image.small.url
      data['thumb_image_url'] = self.image.thumb.url
    else
      data['file_url'] = self.file.url
    end
    data['caption'] = self.caption
    data
  end

  def content
    if content_image?
      self.image
    else
      self.file
    end
  end

  def content?
    if content_image?
      self.image?
    else
      self.file?
    end
  end

  def content_file?
    !content_image?
  end

  def content_image?
    IMAGE_CONTENT_TYPES.include? self.content_type
  end

  def content=(uploader)
    case uploader
    when ActionDispatch::Http::UploadedFile
      self.content_type = uploader.content_type
      self.caption ||= uploader.original_filename
    when File
      path = uploader.path
      self.caption ||= path
      mime_types = MIME::Types.type_for(path)
      if mime_types.present?
        self.content_type = mime_types.first.content_type
      else
        self.content_type = ''
      end
    end
    if content_image?
      self.image = uploader
      self.content_size = self.image.size
    else
      self.file = uploader
      self.content_size = self.file.size
    end
  end

  def content_image_time
    return @content_image_time if @content_image_time
    return nil unless content_image?
    time = self.image.get_exif_date_time_original
    return nil if time.blank?
    time = time.sub(/(\d{2,4})\D(\d{1,2})\D(\d{1,2}) (\d{1,2})\D(\d{1,2})\D(\d{1,2})/, '\1-\2-\3 \4:\5:\6')
    @content_image_time = Time.parse time
  rescue
    nil
  end
end
