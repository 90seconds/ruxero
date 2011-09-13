require 'active_support/core_ext'
require 'nokogiri'
require 'oauth'

require 'ruxero/application'
require 'ruxero/application/partner'
require 'ruxero/application/public'
require 'ruxero/application/private'
require 'ruxero/configuration'
require 'ruxero/version'

module Ruxero
  class NotConfiguredError < StandardError; end
  class NotSupportedError < StandardError; end
  class NotFoundError < StandardError; end
end
