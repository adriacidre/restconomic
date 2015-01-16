require 'spec_helper'

describe Restconomic::Units do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:entity)   { 'units' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}?skippages=0" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(subject.units.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      unit = subject.units.all.first

      expect(unit.unit_number).eql? 1000
    end
  end

  describe 'find' do
    let!(:id)  { 1000 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'find') }

    it 'Should correctly populate each property' do
      unit = subject.units.find(id)

      expect(unit.unit_number).eql? 1000
    end
  end


  describe 'unauthorized responses' do
    let!(:id)  { 1 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'not_found') }

    it 'Should correctly populate each property' do
      expect(subject.units.find(id)).eql? nil
    end
  end

end