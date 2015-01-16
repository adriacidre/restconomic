require 'spec_helper'

describe Restconomic::InvoicesDraft do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:entity)   { 'invoices_draft' }
  let!(:url_path) { 'invoices/draft' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{url_path}?skippages=0" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(subject.invoices_draft.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      invoice = subject.invoices_draft.all.first

      expect(invoice.currency).eql? "GBP"
      expect(invoice.customer.kind_of?(Array)).eql? true
      expect(invoice.customer_address).eql? "Furniture Street 1"
      expect(invoice.customer_city).eql? "Furniture Town"
      expect(invoice.customer_country).eql? "Furniture Country"
      expect(invoice.customer_county).eql? "Furniture County"
      expect(invoice.customer_name).eql? "The Furniture Factory"
      expect(invoice.customer_postal_code).eql? "12345"
      expect(invoice.date).eql? "2007-01-15"
      expect(invoice.deduction_amount).eql? 0.0
      expect(invoice.delivery_address).eql? "Furniture Street 1"
      expect(invoice.delivery_city).eql? "Furniture Town"
      expect(invoice.delivery_postal_code).eql? "12345"
      expect(invoice.due_date).eql? "2007-01-29"
      expect(invoice.gross_amount).eql? 7698.25
      expect(invoice.heading).eql? "Hardware, software and consulting services"
      expect(invoice.id).eql? 20001
      expect(invoice.layout.kind_of?(Array)).eql? true
      expect(invoice.net_amount).eql? 6551.7
      expect(invoice.net_amount_base_currency).eql? 6551.7
      expect(invoice.our_primary_reference.kind_of?(Array)).eql? true
      expect(invoice.payment_terms.kind_of?(Array)).eql? true
      expect(invoice.pdf).eql? "https://restapi.e-conomic.com/invoices/booked/20001/pdf?demo=true"
      expect(invoice.rounding_amount).eql? 0.0
      expect(invoice.sales_document_type).eql? "bookedInvoice"
      expect(invoice.self).eql? "https://restapi.e-conomic.com/invoices/booked/20001?demo=true"
      expect(invoice.vat_amount).eql? 1146.55
      expect(invoice.vat_included).eql? true
    end
  end

end