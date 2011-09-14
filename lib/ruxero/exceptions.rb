module Ruxero

  class NotConfigured < StandardError
    def initialize(attribute)
      @attribute = attribute
    end

    def to_s
      "Required configuration option missing: #{@attribute}"
    end
  end

  class NotImplemented < StandardError
    def initialize(feature)
      @feature = feature
    end

    def to_s
      "#{@feature} not currently implemented"
    end
  end

  class NotFound < StandardError
    def initialize(path)
      @path = path
    end

    def to_s
      "#{@path} - 404 Not Found"
    end
  end

  class UnparseableResponse < StandardError
    def initialize(expected_root_node, actual_root_node)
      @expected_root_node = expected_root_node
      @actual_root_node = actual_root_node
    end

    def to_s
      "Expected root node of #{@expected_root_node}, but got #{@actual_root_node}"
    end
  end

  class ApiException < StandardError
    def initialize(code, type, message, extra = '')
      @code = code
      @type = type
      @message = message
      @extra = extra
    end

    def to_s
      "#{@type} (#{@code}) - #{@message} #{"(#{@extra})" if @extra.present?}"
    end
  end

end
