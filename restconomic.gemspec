Gem::Specification.new do |s|
  s.name        = 'restconomic'
  s.version     = '0.0.1'
  s.date        = '2015-01-13'
  s.summary     = "Wrapper for e-conomic.com's REST API."
  s.description = <<-EOS
                  Ruby wrapper for the e-conomic REST API, that aims at making working with the API bearable.
                  E-conomic is a web-based accounting system. For their marketing speak, see http://www.e-conomic.co.uk/about/. More details about their API at http://www.e-conomic.co.uk/integration/integration-partner/.
                  EOS
  s.authors     = ["Adrià Cidre"]
  s.email       = 'adria@oridoki.com'
  s.homepage    =
    'http://rubygems.org/adriacidre/restconomic'
  s.files         = `git ls-files`.split("\n").reject { |filename| ['.gitignore'].include?(filename) }
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]
  s.license       = 'MIT'

  s.add_development_dependency('rspec', '~> 2.4')
  s.add_development_dependency('webmock', '~> 10.20')
  s.add_dependency('rest-client', '~>  1.6')
  s.add_dependency('json', '~> 1.8')

  s.required_ruby_version = '>= 1.9.3'
end
