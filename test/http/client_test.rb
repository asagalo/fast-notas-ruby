require 'test_helper'

describe InvoicerConnector::Http::Client do

  def setup
    @client = InvoicerConnector::Http::Client.new
  end

  it 'should do a get in google' do
    VCR.use_cassette('request-google', match_requests_on: [:host, :method]) do
      @client.get('https://www.google.com')
    end
  end
end
