module InvoicerConnector::Resource
  class Base
    def endpoint
      raise NotImplemented
    end
  end
end
