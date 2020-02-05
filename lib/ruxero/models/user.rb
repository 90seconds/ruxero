class Ruxero::User < Ruxero::BaseModel

  readonly :user_id, type: String
  readonly :email_address, type: String
  readonly :first_name, type: String
  readonly :last_name, type: String
  readonly :organisation_role, type: String

end
