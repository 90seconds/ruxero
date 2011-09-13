class Ruxero::BaseModel

  cattr_reader :_fields
  @@_fields = Hash.new

  def self.accessor(name, options = {})
    @@_fields[name.to_sym] = options
    attr_accessor name.to_sym
  end

  def self.readonly(name, options = {})
    @@_fields[name.to_sym] = options
    attr_reader name.to_sym
  end

  def initialize(attributes = {})
    super
    _set_attributes(attributes)
  end

  private

  def _set_attributes(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

end
