require "base64"

module InvoicerConnector
  class Http::Authorization

    attr_accessor :api_key

    def set_headers(custom)
      default_headers.merge(custom)
    end

    private

      def default_headers
        [
          "Content-Type" => "application/json",
          "Authorization" => "Basic #{Base64.encode64(@api_key)}"
        ]
      end

      # TO DO: def validate_credentials
      # método que valida se a api_key está presente no request
      # end

      # TO DO: método que define qual api_key será utilizada: Cadastrada na config ou enviada no request
  end
end
