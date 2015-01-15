require_relative 'entity'

module Restconomic
  class Company < Entity
    def base_path
      '/self'
    end

    def all
      raise 'Invalid method'
    end

    def find(id)
      raise 'Invalid method'
    end

    def get
      url = "#{BASE_URL}#{base_path}"
      map @session.request :get, url
    end
  end
end