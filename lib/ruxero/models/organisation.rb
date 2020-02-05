class Ruxero::Organisation < Ruxero::BaseModel

  def self.all(params = {}, headers = {})
    result = Ruxero.application.get("/api.xro/2.0/Organisation")
    parse_collection(result) || Array.new
  end

  readonly :organisation_id, type: String
  readonly :name, type: String
  readonly :legal_name, type: String
  readonly :base_currency, type: String
  readonly :country_code, type: String
  readonly :period_lock_date, type: Time

end
