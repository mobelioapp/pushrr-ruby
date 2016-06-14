require 'faraday_middleware'
require 'faraday/raise_http_exception'

module Pushrr
  module Request

    def get(uri)
      conn.get(uri).body
    end

    private

    def conn
      Faraday.new(url:'http://localhost:3000/api') do |connection|
        connection.headers['Authorization'] = "Token fafeffe6bf3c294bb7f52fc4c47a22fa"
        connection.request  :url_encoded             # form-encode POST params
        connection.response :logger                  # log requests to STDOUT
        connection.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        connection.use      Faraday::Response::ParseJson
        connection.use      FaradayMiddleware::RaiseHttpException
      end
    end
  end
end
