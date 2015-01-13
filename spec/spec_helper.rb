require 'webmock/rspec'
require 'restclient'

WebMock.disable_net_connect!(allow_localhost: true)

require_relative '../lib/restconomic'
Dir[File.expand_path('spec/support/**/*.rb')].each {|f| require f}
