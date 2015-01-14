#Restconomic

Ruby wrapper for the e-conomic REST API, that aims at making working with the API bearable.

E-conomic is a web-based accounting system. For their marketing speak, see http://www.e-conomic.co.uk/about/. More details about their API at http://restdocs.e-conomic.com/.

If you're looking for a SOAP wrapper you can find it on https://github.com/lokalebasen/rconomic

##Usage example

```ruby
  accounts = Restconomic::Accounts.all
  account_number = accounts.first.account_number
  account = Restconomic::Accounts.find(account_number)
```

##Setting up your credentials

You'll need to setup your credentials on environment variables
```sh
ECONOMIC_ACCESS_ID = "your access id"
ECONOMIC_APP_ID = "your app id"
```

##Limitations

At the moment the project is built to do only read operations, feel free to contribute with the write methods

##Todo

- [ ] Create data

##License

Restconomic is licensed under the MIT license. See LICENSE for details.
