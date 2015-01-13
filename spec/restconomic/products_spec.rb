require 'spec_helper'

describe Restconomic::Products do

  let!(:entity)   { 'products' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(Restconomic::Products.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      product = Restconomic::Products.all.first

      expect(product.barred).eql? false
      expect(product.cost_price).eql? 0.0
      expect(product.last_updated).eql? "2011-03-01T17:03:00Z"
      expect(product.name).eql? "Desktop GZ 1.0 Pro"
      expect(product.product_group.kind_of?(Array)).eql? true
      expect(product.product_number).eql? "101"
      expect(product.recommended_price).eql? 0.0
      expect(product.sales_price).eql? 1117.0
      expect(product.self).eql? "https://restapi.e-conomic.com/products/101?demo=true"
      expect(product.unit.kind_of?(Array)).eql? true
    end
  end

  describe 'find' do
    let!(:id)  { 1000 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'find') }

    it 'Should correctly populate each property' do
      product = Restconomic::Products.find(id)

      expect(product.barred).eql? false
      expect(product.cost_price).eql? 0.0
      expect(product.last_updated).eql? "2011-03-01T17:03:00Z"
      expect(product.name).eql? "Desktop GZ 1.0 Pro"
      expect(product.product_group.kind_of?(Array)).eql? true
      expect(product.product_number).eql? "101"
      expect(product.recommended_price).eql? 0.0
      expect(product.sales_price).eql? 1117.0
      expect(product.self).eql? "https://restapi.e-conomic.com/products/101?demo=true"
      expect(product.unit.kind_of?(Array)).eql? true
    end
  end


  describe 'unauthorized responses' do
    let!(:id)  { 1 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'not_found') }

    it 'Should correctly populate each property' do
      expect(Restconomic::Products.find(id)).eql? nil
    end
  end

end