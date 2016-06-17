module Pushrr
  class Notification
    extend Request

    attr_reader :id, :domain, :title, :text, :url, :token, :created_at

    def initialize(attrs)
      attrs.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all(domain)
      subscribers = get("v1/domains/#{domain.token}/notifications")
      subscribers.map { |subscriber| new subscriber }
    end

    def self.create(domain:, title:, text:, url:, subscribers: [], country_codes: [])
      params = {
        title: title,
        text:  text,
        url:   url,
        subscriber_ids: subscribers.map { |s| s.id },
        country_codes: country_codes
      }

      notification = post("v1/domains/#{domain.token}/notifications", params)
      new notification
    end
  end
end
