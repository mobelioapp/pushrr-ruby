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
        end
      end
    end

    def initialize(app)
      super app
      @parser = nil
    end
  end
end
