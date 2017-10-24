require "invoicer_connector/version"
require "invoicer_connector/http/request"

module InvoicerConnector
  LIVE_URL = 'https://api.fastnotas.com/'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    @configuration = Configuration.new
    yield(configuration) if block_given?
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :api_version
    attr_accessor :api_key

    def initialize
      @api_version = 'v1'
      @api_key     = ''
    end
  end
end
