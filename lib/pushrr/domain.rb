module Pushrr
  class Domain
    extend Request

    attr_accessor :id, :host, :token, :status, :logo,
      :welcome_notificaton, :confirmed_at, :created_at

    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.all
      domains = get('v1/domains')
      domains.map { |domain| new domain }
    end

    def self.find(token)
      domain = get("v1/domains/#{token}")
      new domain
    end
  end
end
