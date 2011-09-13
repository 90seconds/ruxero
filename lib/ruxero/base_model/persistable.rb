class Ruxero::BaseModel

  def save
    raise Ruxero::NotSupportedError
  end

  def update_attributes(attributes = {})
    _set_attributes(attributes)
    save
  end

end
