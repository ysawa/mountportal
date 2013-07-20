module Mongoid::DateTimeField

  class << self
    def included(klass)
      klass.extend ClassMethods
    end
  end

  module ClassMethods
    def date_time_field(name)
      class_eval <<-RUBY_EVAL
        field :#{name}_date, type: Date
        field :#{name}_time, type: Integer

        def #{name}
          if self.#{name}_date && self.#{name}_time
            date = self.#{name}_date
            time = self.#{name}_time
            hour = time / 3600
            min = (time % 3600) / 60
            sec = time % 60
            Time.new(date.year, date.month, date.day, hour, min, sec)
          elsif self.#{name}_date
            date = self.#{name}_date
            Time.new(date.year, date.month, date.day)
          else
            nil
          end
        end

        def #{name}_year
          if self.#{name}_date
            self.#{name}.date.year
          end
        end

        def #{name}_month
          if self.#{name}_date
            self.#{name}.date.month
          end
        end

        def #{name}_day
          if self.#{name}_date
            self.#{name}.date.day
          end
        end

        def #{name}_hour
          if self.#{name}_time
            self.#{name}_time / 3600
          end
        end

        def #{name}_min
          if self.#{name}_time
            self.#{name}_time / 60
          end
        end

        def #{name}_sec
          if self.#{name}_time
            self.#{name}_time % 60
          end
        end

        def #{name}=(time)
          if time.present?
            time = time.to_time
            self.#{name}_date = time.to_date
            self.#{name}_time = time.hour * 3600 + time.min * 60 + time.sec
            time
          else
            self.#{name}_date = nil
            self.#{name}_time = nil
            nil
          end
        end
      RUBY_EVAL
    end
  end
end
