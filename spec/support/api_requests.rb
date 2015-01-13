def mock_request(operation, url, entity, request)
  response_body = IO.read("#{File.dirname(__FILE__)}/../fixtures/#{entity}/#{request}.json")
  stub_request(operation.to_sym, url).
      to_return(:body => response_body, :status => 200)
end