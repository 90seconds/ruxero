module Ruxero

  class << self

    def application
      raise Ruxero::NotConfigured.new(:application) if Ruxero.configuration.application.nil?
      @application ||= Ruxero.configuration.application.new
    end

  end

  class Application

    attr_reader :consumer, :access_token

    DEFAULT_OPTIONS = {
      :site               => "https://api.xero.com",
      :request_token_path => "/oauth/RequestToken",
      :authorize_path     => "/oauth/Authorize",
      :access_token_path  => "/oauth/AccessToken"
    }

    def initialize
      raise Ruxero::NotImplemented.new(self.class.name)
    end

    def get(path, headers = {})
      request(:get, path, headers)
    end

    def head(path, headers = {})
      request(:head, path, headers)
    end

    def post(path, body = '', headers = {})
      request(:post, path, body, headers)
    end

    def put(path, body = '', headers = {})
      request(:put, path, body, headers)
    end

    def delete(path, headers = {})
      request(:delete, path, headers)
    end

    private

    def request(http_method, path, *arguments)
      options = arguments.extract_options!
      options['charset'] = 'utf-8'
      options['Content-Type'] = 'application/x-www-form-urlencoded' unless http_method == :get
      arguments = { :xml => arguments.join } if [:post, :put].include?(http_method)

      arguments = [arguments, options].flatten
      response = access_token.request(http_method, path, *arguments)

      case response.code.to_i
      when 200
        parse(response, :expect => 'Response')

      when 400
        result = parse(response, :expect => 'ApiException')
        raise Ruxero::ApiException.new(
          result.css("ErrorNumber").text,
          result.css("Type").text,
          result.css("Message").text
        )

      when 404
        raise Ruxero::NotFound.new(path)

      else
        raise "Unknown response code: #{response.code.to_i}"
      end
    end

    def parse(response, options = {})
      result = ::Nokogiri::XML(response.body)
      return result if result.root.name == options[:expect]
      raise Ruxero::UnparseableResponse.new(options[:expect], result.root.name)
    end

  end

end
