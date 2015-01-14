require_relative 'entity'

module Restconomic
  class InvoicesBooked < Entity
    def base_path
      '/invoices/booked'
    end

    def find(number)
      raise 'Invalid method'
    end
  end
end