class Ruxero::BaseModel

  def save
    raise Ruxero::NotImplemented.new("#{self.class.name}#save")
  end

  def update_attributes(attributes = {})
    _set_attributes(attributes)
    save
  end

end
