require_relative 'entity'

module Restconomic
  class InvoicesBooked < Entity
    def self.base_path
      '/invoices/booked'
    end

    def self.find(number)
      raise 'Invalid method'
    end
  end
end