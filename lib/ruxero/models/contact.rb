class Ruxero::Contact < Ruxero::BaseModel

  readonly :contact_id, type: String
  accessor :contact_status, type: String
  accessor :name, type: String
  accessor :first_name, type: String
  accessor :last_name, type: String
  accessor :email_address, type: String
  accessor :bank_account_details, type: String
  accessor :tax_number, type: String
  accessor :accounts_receivable_tax_type, type: String
  accessor :accounts_payable_tax_type, type: String
  readonly :updated_date_utc, type: Time
  accessor :is_supplier, type: Boolean
  accessor :is_customer, type: Boolean
  accessor :default_currency, type: String
  # accessor :addresses, type: lambda { Ruxero::Address }, collection: true
  # accessor :phones, type: lambda { Ruxero::Phone }, collection: true
  # accessor :contact_groups, type: lambda { Ruxero::ContactGroup }, collection: true

end
