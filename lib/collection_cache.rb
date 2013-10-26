class CollectionCache

  attr_reader :collection
  attr_reader :klass

  def find(id)
    object = nil
    case id
    when @klass
      object = id
    when String, Moped::BSON::ObjectId
      @collection.each do |target|
        if target.id.to_s == id.to_s
          object = target
          break
        end
      end
      object = @klass.find(id) unless object
    else
      raise 'invalid type of collection'
    end
    unless @collection.include? object
      @collection << object
    end
    object
  end

  def initialize(klass, collection = [])
    @klass = klass
    case collection
    when nil
      @collection = []
    when @klass
      @collection = [collection]
    when Array
      @collection = collection
    else
      raise 'invalid type of collection'
    end
  end
end
