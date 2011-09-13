require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/inflector'

# Allows us to do `true.is_a?(Boolean)`
module Boolean; end
class TrueClass; include Boolean; end
class FalseClass; include Boolean; end

require 'nokogiri'
require 'oauth'

require 'ruxero/application'
require 'ruxero/application/partner'
require 'ruxero/application/private'
require 'ruxero/application/public'
require 'ruxero/base_model/attributable'
require 'ruxero/base_model/finders'
require 'ruxero/base_model/parsers'
require 'ruxero/base_model/persistable'
require 'ruxero/configuration'
require 'ruxero/models/contact'
require 'ruxero/models/invoice'
require 'ruxero/version'

module Ruxero
  class NotConfiguredError < StandardError; end
  class NotSupportedError < StandardError; end
  class NotFoundError < StandardError; end
  class NotParsable < StandardError; end
end
