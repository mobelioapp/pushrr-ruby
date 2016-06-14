module Pushrr
  class Subscriber
    extend Request

    attr_reader :id, :country, :country_code, :browser, :created_at

    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all(domain)
      subscribers = get("v1/domains/#{domain.token}/subscribers")
      subscribers.map { |subscriber| new subscriber }
    end
  end
end
