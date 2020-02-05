require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/object/blank'
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
require 'ruxero/exceptions'
require 'ruxero/models/account'
require 'ruxero/models/contact'
require 'ruxero/models/invoice'
require 'ruxero/models/organisation'
require 'ruxero/models/payment'
require 'ruxero/models/user'
require 'ruxero/version'

module Ruxero
end
