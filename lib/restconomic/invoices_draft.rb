require_relative 'entity'

module Restconomic
  class InvoicesDraft < Entity
    def base_path
      '/invoices/draft'
    end
  end
end