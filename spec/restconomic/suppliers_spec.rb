require 'spec_helper'

describe Restconomic::Suppliers do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:entity) { 'suppliers' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}?skippages=0" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(subject.suppliers.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      supplier = subject.suppliers.all.first

      expect(supplier.contacts).eql? "https://restapi.e-conomic.com/suppliers/101/contacts?demo=true"
      expect(supplier.corporate_identification_number).eql? "12345678"
      expect(supplier.currency).eql? "GBP"
      expect(supplier.name).eql? "Software Supplier"
      expect(supplier.payment_terms.kind_of?(Array)).eql? true
      expect(supplier.self).eql? "https://restapi.e-conomic.com/suppliers/101?demo=true"
      expect(supplier.supplier_group.kind_of?(Array)).eql? true
      expect(supplier.supplier_number).eql? 101
      expect(supplier.vat_zone.kind_of?(Array)).eql? true
    end
  end

  describe 'find' do
    let!(:id)  { 1000 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'find') }

    it 'Should correctly populate each property' do
      supplier = subject.suppliers.find(id)

      expect(supplier.contacts).eql? "https://restapi.e-conomic.com/suppliers/101/contacts?demo=true"
      expect(supplier.corporate_identification_number).eql? "12345678"
      expect(supplier.currency).eql? "GBP"
      expect(supplier.name).eql? "Software Supplier"
      expect(supplier.payment_terms.kind_of?(Array)).eql? true
      expect(supplier.self).eql? "https://restapi.e-conomic.com/suppliers/101?demo=true"
      expect(supplier.supplier_group.kind_of?(Array)).eql? true
      expect(supplier.supplier_number).eql? 101
      expect(supplier.vat_zone.kind_of?(Array)).eql? true
    end
  end


  describe 'unauthorized responses' do
    let!(:id)  { 1 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'not_found') }

    it 'Should correctly populate each property' do
      expect(subject.suppliers.find(id)).eql? nil
    end
  end

end