class Ruxero::BaseModel

  def self.all(params = {})
    path = "/api.xro/2.0/#{pluralized_name}"
    if params.any?
      path += "?" + params.map {|key,value| "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"}.join("&")
    end
    result = Ruxero.application.get(path)
    parse_collection(result) || Array.new
  end

end
