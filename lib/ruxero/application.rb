module Ruxero

  class << self

    def application
      if Ruxero.configuration.application.nil?
        raise Ruxero::NotConfigured.new(:application)
      end

      Ruxero.configuration.application.new
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
      attempts = 0

      begin
        attempts += 1

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
            result.css("ErrorNumber").first.text,
            result.css("Type").first.text,
            result.css("Message").first.text,
            result.css("ValidationErrors ValidationError Message").collect(&:text).join(', ')
          )

        when 401
          handle_oauth_error!(response)

        when 404
          raise Ruxero::NotFound.new(path)

        else
          raise "Unknown response code: #{response.code.to_i}"
        end
      rescue Ruxero::RateLimitExceeded => exception
        raise exception if attempts > Ruxero.configuration.rate_limit_retry_attempts
        sleep Ruxero.configuration.rate_limit_retry_interval
        retry
      end
    end

    def parse(response, options = {})
      result = ::Nokogiri::XML(response.body)
      return result if result.root.name == options[:expect]
      raise Ruxero::UnparseableResponse.new(options[:expect], result.root.name)
    end

    def handle_oauth_error!(response)
      error_details = CGI.parse(response.body)
      error_key = error_details["oauth_problem"].first
      error_desc = error_details["oauth_problem_advice"].first

      case error_key
      when "rate limit exceeded"
        raise Ruxero::RateLimitExceeded.new("#{error_desc} (#{error_key})")
      else
        raise Ruxero::GenericOAuthError.new("#{error_desc} (#{error_key})")
      end
    end

  end

end
