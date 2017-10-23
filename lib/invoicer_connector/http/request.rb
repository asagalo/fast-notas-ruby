require "base64"
require "restclient"
require "json"
require "http/authorization"

module InvoicerConnector
  class Http::Request

    attr_accessor :api_key, :api_endpoint

    def initialize(api_key=nil, api_endpoint=nil, api_headers=nil, api_payload=nil)
      @api_key = api_key
      @api_endpoint = api_endpoint
      # @api_headers = Http::Authorization.set_headers
      @api_payload = api_payload
    end

    def all(params={})
      request(:get, @api_endpoint, params)
    end

    def get(params={})
      request(:get, "@api_endpoint}/params['id']")
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

      def request(method= :get, api_endpoint=nil, params={}, api_payload=nil)
          @last_request = RestClient::Request.execute(
            method: method,
            url: "#{LIVE_URL}#{api_endpoint}?#{params.to_query}",
            payload: payload,
            headers: @api_headers
          )

          response(@last_request)
      end

      def parse_url
        # TODO : Encontrar uma forma de criar todas url`s possíveis no invoicer
        if params["id"]
          LIVE_URL + @api_endpoint + params["id"]
        else
          LIVE_URL + @api_endpoint
        end
      end
  end
end
