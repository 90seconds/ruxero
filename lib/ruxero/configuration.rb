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

    def self.inspect
      settings = Ruxero.configuration.class_variables.collect do |class_var|
        "#{class_var} => #{class_variable_get(class_var).inspect}"
      end
      "Ruxero::Configurator #{settings.join(', ')}"
    end

  end

end
