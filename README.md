#Restconomic

Ruby wrapper for the e-conomic REST API, that aims at making working with the API bearable.

E-conomic is a web-based accounting system. For their marketing speak, see http://www.e-conomic.co.uk/about/. More details about their API at http://restdocs.e-conomic.com/.

If you're looking for a SOAP wrapper you can find it on https://github.com/lokalebasen/rconomic

[![Build Status](https://secure.travis-ci.org/adriacidre/restconomic.png?branch=master)](http://travis-ci.org/adriacidre/restconomic)
[![Coverage Status](https://coveralls.io/repos/adriacidre/restconomic/badge.png?branch=master)](https://coveralls.io/r/adriacidre/restconomic?branch=master)
[![Code Climate](https://codeclimate.com/github/adriacidre/restconomic.png)](https://codeclimate.com/github/adriacidre/restconomic)


##Usage example

```ruby
  session = Restconomic::Session.new('appid', 'accessid')
  accounts = session.accounts.all
  account_number = accounts.first.account_number
  account = session.accounts.find(account_number)
```

##Limitations

At the moment the project is built to do only read operations, feel free to contribute with the write methods

##Todo

- [ ] Create data

##License

Restconomic is licensed under the MIT license. See LICENSE for details.
