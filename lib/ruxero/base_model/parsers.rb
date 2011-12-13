class Ruxero::BaseModel

  def self.singularized_name
    self.name.demodulize.singularize
  end

  def self.pluralized_name
    self.name.demodulize.pluralize
  end

  def self.parse_collection(collection)
    collection.css("#{pluralized_name} #{singularized_name}").collect { |record|
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
    case field[:type].to_s
    when 'String'  then value.to_s
    when 'Time'    then Time.parse("#{value} UTC")
    when 'Date'    then Date.parse(value)
    when 'Float'   then value.to_f
    when 'Boolean' then (value == 'true')
    else
      if field[:type].to_s =~ /Ruxero/ # Ruxero model
        field[:type].parse_record(element)
      else
        value
      end
    end
  end

end
