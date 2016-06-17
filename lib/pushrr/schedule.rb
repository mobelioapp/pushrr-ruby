module Pushrr
  class Schedule
    extend Request

    def initialize(attrs)
      attrs.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
