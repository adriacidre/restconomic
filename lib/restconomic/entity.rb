module Restconomic
  class Entity
    BASE_URL = 'https://restapi.e-conomic.com/'
    @pagesize = 20

    def self.all(page = 0)
      url    = "#{BASE_URL}#{base_path}"
      params = { skippages: page, pagesize: @pagesize, headers: headers}
      request :get, url, params
    end

    def self.find(number)
      url = "#{BASE_URL}#{base_path}/#{number}"
      request :get, url
    end

    private
      def self.map(body)
        items = JSON.parse(body)
        if items.has_key? 'collection'
          response = []
          items['collection'].each do |item|
            response << map_object(item)
          end
        else
          return if items['httpStatusCode'] == 401
          response = map_object items
        end
        response
      end

      def self.map_object(item)
        object = self.new
        item.each do |key, value|
          key = underscore(key)
          object.instance_variable_set("@#{key}", value)
          object.class.__send__(:attr_accessor, key)
        end
        object
      end

      def self.request(method, url, params = {})
        map RestClient.send(method, url, params)
      end

      def self.base_path
        class_name = middlescore(self.name.split('::').last)
        "/#{class_name}"
      end

      def self.headers
        { :accessid => accessid, :appid => appid }
      end

      def self.accessid
        ENV['ECONOMIC_ACCESS_ID'] or 'demo'
      end

      def self.appid
        ENV['ECONOMIC_APP_ID'] or 'demo'
      end

      def self.underscore(string)
        string.gsub(/::/, '/').
            gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            tr("-", "_").
            downcase
      end

      def self.middlescore(string)
        string.gsub(/::/, '/').
            gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            tr("_", "-").
            downcase
      end
  end
end

