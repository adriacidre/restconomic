require 'spec_helper'

describe Restconomic::Accounts do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:entity)   { 'apps' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}?skippages=0" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(subject.apps.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      app = subject.apps.all.first

      expect(app.app_number).eql? 447
      expect(app.created).eql? "2014-06-19"
      expect(app.name).eql? "demo integration"
      expect(app.public_token).eql? "lJId73uLXL4vPiHBBb5Sb_y28vr9K4vjEVcPk-jutEA1"
      expect(app.required_roles.kind_of?(Array)).equal? true
      expect(app.self).eql? "https://restapi.e-conomic.com/apps/447?demo=true"
    end
  end

  describe 'find' do
    let!(:id)  { 1000 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'find') }

    it 'Should correctly populate each property' do
      app = subject.apps.find(id)

      expect(app.app_number).eql? 447
      expect(app.created).eql? "2014-06-19"
      expect(app.name).eql? "demo integration"
      expect(app.public_token).eql? "lJId73uLXL4vPiHBBb5Sb_y28vr9K4vjEVcPk-jutEA1"
      expect(app.required_roles.kind_of?(Array)).equal? true
      expect(app.self).eql? "https://restapi.e-conomic.com/apps/447?demo=true"
    end
  end


  describe 'unauthorized responses' do
    let!(:id)  { 1 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'not_found') }

    it 'Should correctly populate each property' do
      expect(subject.apps.find(id)).eql? nil
    end
  end

end