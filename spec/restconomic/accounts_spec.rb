require 'spec_helper'

describe Restconomic::Accounts do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:entity)   { 'accounts' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(subject.accounts.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      account = subject.accounts.all.first

      expect(account.account_number).eql? 1000
      expect(account.account_type).eql? 'heading'
      expect(account.accounting_years).eql? 'https://restapi.e-conomic.com/accounts/1000/accounting-years?demo=true'
      expect(account.balance).eql? 0.0
      expect(account.block_direct_entries).eql? false
      expect(account.debit_credit).eql? 'debit'
      expect(account.name).eql? 'FIXED ASSETS'
    end
  end

  describe 'find' do
    let!(:id)  { 1000 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'find') }

    it 'Should correctly populate each property' do
      account = subject.accounts.find(id)

      expect(account.account_number).eql? id
      expect(account.account_type).eql? 'heading'
      expect(account.accounting_years).eql? 'https://restapi.e-conomic.com/accounts/1000/accounting-years?demo=true'
      expect(account.balance).eql? 0.0
      expect(account.block_direct_entries).eql? false
      expect(account.debit_credit).eql? 'debit'
      expect(account.name).eql? 'FIXED ASSETS'
    end
  end


  describe 'unauthorized responses' do
    let!(:id)  { 1 }
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{entity}/#{id}" }
    before     { mock_request('get', url, entity, 'not_found') }

    it 'Should correctly populate each property' do
      expect(subject.accounts.find(id)).eql? nil
    end
  end

end