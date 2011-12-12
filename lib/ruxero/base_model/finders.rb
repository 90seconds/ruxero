class Ruxero::BaseModel

  def self.all(params = {}, headers = {})
    parts = ["/api.xro/2.0/#{pluralized_name}", build_conditions(params)]
    result = Ruxero.application.get(parts.join('?'), headers)
    parse_collection(result) || Array.new
  end

  private

  def self.build_conditions(params)
    if params.any?
      params.map { |k, v|
        "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
      }.join("&")
    end
  end

end
