require 'faraday'

module FaradayMiddleware
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
        when 401
          raise Pushrr::Unauthorized
        when 404
          raise Pushrr::NotFound
        when 400
          raise Pushrr::BadRequest, error_message_400(response)
        end
      end
    end

    def initialize(app)
      super app
      @parser = nil
    end

    private

    def error_message_400(response)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]} #{response[:body]}"
    end
  end
end
