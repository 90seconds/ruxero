module Ruxero

  class << self

    def configure(&block)
      yield(configuration)
    end

    def configuration
      Configurator
    end

  end

  class Configurator

    cattr_accessor :application
    cattr_accessor :oauth_consumer_key
    cattr_accessor :oauth_consumer_secret
    cattr_accessor :private_key_path
    cattr_accessor :rate_limit_retry_attempts
    cattr_accessor :rate_limit_retry_interval

    @@rate_limit_retry_attempts = 0
    @@rate_limit_retry_interval = 2

    def self.inspect
      settings = Ruxero.configuration.class_variables.collect do |class_var|
        "#{class_var} => #{class_variable_get(class_var).inspect}"
      end
      "Ruxero::Configurator #{settings.join(', ')}"
    end

  end

end
