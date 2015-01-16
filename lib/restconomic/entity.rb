module Restconomic
  class Entity
    BASE_URL = 'https://restapi.e-conomic.com/'

    def initialize(session, fields = {})
      @session = session
      fields.each do |key, value|
        key = underscore(key)
        self.instance_variable_set("@#{key}", value)
        self.class.__send__(:attr_accessor, key)
      end
    end

    def all(page = 0, size = nil)
      url    = "#{BASE_URL}#{base_path}"
      params = { skippages: page }
      params[:pagesize] = size unless size.nil?
      map @session.get url, params
    end

    def find(number)
      url = "#{BASE_URL}#{base_path}/#{number}"
      map @session.get url
    end

    private
      def map(body)
        items = JSON.parse(body)
        if items.has_key? 'collection'
          response = []
          items['collection'].each do |item|
            response << self.class.new(@session, item)
          end
        else
          return if items['httpStatusCode'] == 401
          response = self.class.new(@session, items)
        end
        response
      end

      def base_path
        class_name = middlescore(self.class.name.split('::').last)
        "/#{class_name}"
      end

      def underscore(string)
        string.gsub(/::/, '/').
            gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            tr("-", "_").
            downcase
      end

      def middlescore(string)
        string.gsub(/::/, '/').
            gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            tr("_", "-").
            downcase
      end
  end
end

