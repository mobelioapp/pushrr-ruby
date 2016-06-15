module Pushrr
  class Notification
    extend Request

    attr_reader :id, :domain, :title, :text, :url, :token, :created_at
    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all(domain)
      subscribers = get("v1/domains/#{domain.token}/notifications")
      subscribers.map { |subscriber| new subscriber }
    end
  end
end
