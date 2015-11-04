class Ruxero::BaseModel

  def self.singularized_name
    self.name.demodulize.singularize
  end

  def self.pluralized_name
    self.name.demodulize.pluralize
  end

  def self.parse_collection(collection, at_root = false)
    selectors = [(pluralized_name if !at_root), singularized_name]
    collection.css(selectors.compact.join(" ")).collect { |record|
      parse_record(record)
    }.compact
  end

  def self.parse_record(record)
    new_record = self.new
    record.elements.each do |element|
      field_name = element.name.underscore.to_sym
      field = self._fields[field_name]
      next unless field
      value = convert_value(field, element, element.text.strip)
      new_record.instance_variable_set("@#{field_name}", value)
    end
    new_record
  end

  def self.convert_value(field, element, value)
    type = field[:type]
    type = type.call if type.respond_to?(:call)

    case type.to_s
    when 'String'  then value.to_s
    when 'Time'    then Time.parse("#{value} UTC")
    when 'Date'    then Date.parse(value)
    when 'Float'   then value.to_f
    when 'Boolean' then (value == 'true')
    else
      if type.to_s =~ /Ruxero/ # Ruxero model
        if field[:collection]
          type.parse_collection(element, true)
        else
          type.parse_record(element)
        end
      else
        value
      end
    end
  end

end
