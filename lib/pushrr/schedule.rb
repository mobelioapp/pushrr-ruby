module Pushrr
  class Schedule
    extend Request

    attr_reader :token, :interval, :day, :hour, :title, :text,
      :url, :filter, :created_at, :updated_at

    def initialize(attrs)
      attrs.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all(domain)
      schedules = get("v1/domains/#{domain.token}/schedules")
      schedules.map { |schedule| new schedule }
    end

    def self.find(domain, token)
      schedule = get("v1/domains/#{domain.token}/schedules/#{token}")
      new schedule
    end

    def self.create(opts={})
      params = {
        interval: opts[:interval],
        day:      opts[:day],
        hour:     opts[:hour],
        title:    opts[:title],
        text:     opts[:text],
        url:      opts[:url]
      }

      url = "v1/domains/#{domain.token}/schedules"
      schedule = post(url, params)
      new schedule
    end
  end
end
