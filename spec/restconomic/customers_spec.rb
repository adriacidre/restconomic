require 'spec_helper'

describe Restconomic::Customers do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:entity)   { 'customers' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(subject.customers.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      customer = subject.customers.all.first

      expect(customer.address).eql? "1 Data Street"
      expect(customer.attention.kind_of?(Array)).eql? true
      expect(customer.balance).eql? 6259.2
      expect(customer.city).eql? "Data Town"
      expect(customer.corporate_identification_number).eql? "123456789"
      expect(customer.country).eql? "Data Country"
      expect(customer.county).eql? "Data County"
      expect(customer.currency).eql? "GBP"
      expect(customer.customer_contact.kind_of?(Array)).eql? true
      expect(customer.customer_group.kind_of?(Array)).eql? true
      expect(customer.customer_number).eql? 101
      expect(customer.email).eql? "api@e-conomic.com"
      expect(customer.last_updated).eql? "2014-12-15T10:23:45Z"
      expect(customer.layout.kind_of?(Array)).eql? true
      expect(customer.name).eql? "Datahouse Ltd."
      expect(customer.payment_terms.kind_of?(Array)).eql? true
      expect(customer.sales_person.kind_of?(Array)).eql? true
      expect(customer.self).eql? "https://restapi.e-conomic.com/customers/101?demo=true"
      expect(customer.telephone_and_fax_number).eql? "80123456"
      expect(customer.vat_zone.kind_of?(Array)).eql? true
    end
  end

  describe 'find' do
    let!(:id)  { 1000 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'find') }

    it 'Should correctly populate each property' do
      customer = subject.customers.find(id)

      expect(customer.address).eql? "1 Data Street"
      expect(customer.attention.kind_of?(Array)).eql? true
      expect(customer.balance).eql? 6259.2
      expect(customer.city).eql? "Data Town"
      expect(customer.corporate_identification_number).eql? "123456789"
      expect(customer.country).eql? "Data Country"
      expect(customer.county).eql? "Data County"
      expect(customer.currency).eql? "GBP"
      expect(customer.customer_contact.kind_of?(Array)).eql? true
      expect(customer.customer_group.kind_of?(Array)).eql? true
      expect(customer.customer_number).eql? 101
      expect(customer.email).eql? "api@e-conomic.com"
      expect(customer.last_updated).eql? "2014-12-15T10:23:45Z"
      expect(customer.layout.kind_of?(Array)).eql? true
      expect(customer.name).eql? "Datahouse Ltd."
      expect(customer.payment_terms.kind_of?(Array)).eql? true
      expect(customer.sales_person.kind_of?(Array)).eql? true
      expect(customer.self).eql? "https://restapi.e-conomic.com/customers/101?demo=true"
      expect(customer.telephone_and_fax_number).eql? "80123456"
      expect(customer.vat_zone.kind_of?(Array)).eql? true
    end
  end


  describe 'unauthorized responses' do
    let!(:id)  { 1 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'not_found') }

    it 'Should correctly populate each property' do
      expect(subject.customers.find(id)).eql? nil
    end
  end

end