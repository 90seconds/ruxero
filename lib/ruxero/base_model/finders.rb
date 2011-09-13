class Ruxero::BaseModel

  def self.all(*args)
    result = Ruxero.application.get("/api.xro/2.0/#{pluralized_name}")
    parse_collection(result) || Array.new
  end

end
