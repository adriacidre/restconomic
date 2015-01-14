require 'spec_helper'

describe Restconomic::Accounts do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:entity)   { 'accounting_years' }
  let!(:url_path) { 'accounting-years' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{url_path}" }
    before     { mock_request('get', url, entity, 'all') }

    it 'Should return built in objects' do
      expect(subject.accounting_years.all.count).eql? 20
    end

    it 'Should correctly populate each property' do
      accounting_years = subject.accounting_years.all.first

      expect(accounting_years.closed).eql? true
      expect(accounting_years.entries).eql? "https://restapi.e-conomic.com/accounting-years/2006/entries?demo=true"
      expect(accounting_years.from_date).eql? "2006-01-01"
      expect(accounting_years.periods).eql? "https://restapi.e-conomic.com/accounting-years/2006/periods?demo=true"
      expect(accounting_years.self).eql? "https://restapi.e-conomic.com/accounting-years/2006?demo=true"
      expect(accounting_years.to_date).eql? "2006-12-31"
      expect(accounting_years.totals).eql? "https://restapi.e-conomic.com/accounting-years/2006/totals?demo=true"
      expect(accounting_years.vouchers).eql? "https://restapi.e-conomic.com/accounting-years/2006/vouchers?demo=true"
      expect(accounting_years.year).eql? "2006"
    end
  end

end