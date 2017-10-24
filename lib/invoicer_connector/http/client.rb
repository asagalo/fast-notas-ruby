require "rest-client"
require "json"

module InvoicerConnector::Http
  class Client

    attr_accessor :api_key, :api_endpoint

    def initialize(api_key=nil, api_endpoint=nil, api_headers=nil, api_payload=nil)
      @api_key = api_key
      @api_endpoint = api_endpoint
      # @api_headers = Http::Authorization.set_headers
      @api_payload = api_payload
    end

    def all()
      request(:get, @api_endpoint, params)
    end

    def get(url, params={})
      request(:get, url, params)
    end

    def post(payload)
      request(:post, @api_endpoint, @api_payload)
    end

    def put(id, payload)
    end

    def delete(id)
    end

    def response(last_request)
      JSON.parse(last_request.body)
    end

    private

    def request(method=:get, url=nil, params={}, payload=nil)
        @last_request = RestClient::Request.execute(
          method: method,
          url: url,
          payload: payload,
          headers: @api_headers
        )

        response(@last_request)
    end
  end
end
