class Ruxero::PrivateApplication < Ruxero::Application

  def initialize
    @consumer = ::OAuth::Consumer.new(
      Ruxero.configuration.oauth_consumer_key,
      Ruxero.configuration.oauth_consumer_secret,
      DEFAULT_OAUTH_OPTIONS.merge({
        :signature_method => 'RSA-SHA1',
        :private_key_file => Ruxero.configuration.private_key_path
      }.merge(Ruxero.configuration.oauth_consumer_options))
    )

    @access_token = ::OAuth::AccessToken.new(
      @consumer,
      Ruxero.configuration.oauth_consumer_key,
      Ruxero.configuration.oauth_consumer_secret
    )
  end

end
