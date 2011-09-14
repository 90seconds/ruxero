class Ruxero::BaseModel

  def self.all(params = {})
    parts = ["/api.xro/2.0/#{pluralized_name}", build_conditions(params)]
    result = Ruxero.application.get(parts.join('?'))
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
