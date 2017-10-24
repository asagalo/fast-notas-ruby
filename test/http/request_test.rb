require 'test_helper'

describe InvoicerConnector::Http::Request do

  def setup
    @request = InvoicerConnector::Http::Request.new
  end

  it 'should do a get in google' do
    VCR.use_cassette('request-google', match_requests_on: [:host, :method]) do
      @request.get('https://www.google.com')
    end
  end
end
