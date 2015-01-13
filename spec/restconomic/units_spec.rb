require 'spec_helper'

describe Restconomic::Units do

  let!(:entity)   { 'units' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(Restconomic::Units.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      unit = Restconomic::Units.all.first

      expect(unit.unit_number).eql? 1000
    end
  end

  describe 'find' do
    let!(:id)  { 1000 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'find') }

    it 'Should correctly populate each property' do
      unit = Restconomic::Units.find(id)

      expect(unit.unit_number).eql? 1000
    end
  end


  describe 'unauthorized responses' do
    let!(:id)  { 1 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'not_found') }

    it 'Should correctly populate each property' do
      expect(Restconomic::Units.find(id)).eql? nil
    end
  end

end