require 'spec_helper'

describe Restconomic::Accounts do

  let!(:subject)  { Restconomic::Session.new('a', 'b') }
  let!(:url_path) { 'self' }
  let!(:entity)   { 'company' }

  describe 'all' do
    let!(:url) { "#{Restconomic::Entity::BASE_URL}/#{url_path}" }
    before     { mock_request('get', url, entity, 'get') }

    it 'Should correctly populate each property' do
      company = subject.company.get

      expect(company.agreement_number).eql? 972010
      expect(company.bank_information).eql? ({
          "bankName" => "MyBank plc",
          "swiftCode" => "MYBKGB99",
          "ibanNumber" => "GB99MYBK12345678909876",
          "bankSortCode" => "11-22-33",
          "bankAccountNumber" => "12345678" })
      expect(company.company).eql? ({
           "addressLine1" => "Trial Street",
           "zip" => "TR1 1TR",
           "city" => "Trial Town",
           "name" => "e-conomic rest api demo",
           "phoneNumber" => "08456-800-471",
           "faxNumber" => "01234-987654",
           "attention" => "e-conomic developer",
           "website" => "www.yourcompany.co.uk",
           "email" => "info@e-conomic.com",
           "companyIdentificationNumber" => "87654321",
           "vatNumber" => "GB 123 4567 89"})
      expect(company.modules).eql? ([
           { "moduleNumber"=>3,
             "name"=>"Indscanning",
             "self"=>"https://restapi.e-conomic.com/modules/agreement/3?demo=true"
           }, {
             "moduleNumber"=>22,
             "name"=>"API",
             "self"=>"https://restapi.e-conomic.com/modules/agreement/22?demo=true"
           }])
      expect(company.self).eql? "https://restapi.e-conomic.com/self?demo=true"
      expect(company.settings).eql? ({"baseCurrency"=>"GBP"})
      expect(company.signup_date).eql? "2014-06-19"
      expect(company.user_name).eql? "e-c"
    end
  end

end