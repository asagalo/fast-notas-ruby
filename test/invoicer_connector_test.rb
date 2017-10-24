require 'test_helper'

describe InvoicerConnector do

  it 'should have a version' do
    refute_nil ::InvoicerConnector::VERSION
  end

  describe 'with a gem configured' do
    before do
      InvoicerConnector.configure do |c|
        c.api_version = 'v1'
        c.api_key     = 'AFUNNYAPIKEY'
      end
    end

    it 'api version should be setted' do
      assert_equal InvoicerConnector.configuration.api_version, 'v1'
      assert_equal InvoicerConnector.configuration.api_key, 'AFUNNYAPIKEY'
    end
  end

  describe 'with a gem not configured' do
    before { InvoicerConnector.configure }

    it 'shuld have some default values' do
      assert_equal InvoicerConnector.configuration.api_version, 'v1'
      assert_equal InvoicerConnector.configuration.api_key, ''
    end
  end
end
