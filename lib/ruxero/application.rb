module Ruxero

  class << self

    def application
      raise Ruxero::NotConfiguredError if Ruxero.configuration.application.nil?
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
      raise Ruxero::NotSupportedError
    end

    def request(http_method, path, *arguments)
      response = access_token.request(http_method, path, *arguments)

      case response.code.to_i
      when 200
        result = ::Nokogiri::XML(response.body)
        raise Ruxero::NotParsable unless result.root.name == 'Response'
        result
      else
        response
      end
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

  end

end
