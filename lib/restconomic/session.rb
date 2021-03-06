module Restconomic
  class Session
    def initialize(appid, accessid)
      @appid = appid
      @accessid = accessid
    end

    def accounting_years
      Restconomic::AccountingYears.new(self)
    end

    def accounts
      Restconomic::Accounts.new(self)
    end

    def apps
      Restconomic::Apps.new(self)
    end

    def customers
      Restconomic::Customers.new(self)
    end

    def invoices_booked
      Restconomic::InvoicesBooked.new(self)
    end

    def invoices_draft
      Restconomic::InvoicesDraft.new(self)
    end

    def products
      Restconomic::Products.new(self)
    end

    def suppliers
      Restconomic::Suppliers.new(self)
    end

    def units
      Restconomic::Units.new(self)
    end

    def company
      Restconomic::Company.new(self)
    end

    def get(url, params = {})
      params = URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
      RestClient.get("#{url}?#{params}", headers)
    end

    def headers
      { :accessid => @accessid, :appid => @appid }
    end

  end
end