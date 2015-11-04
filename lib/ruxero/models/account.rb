class Ruxero::Account < Ruxero::BaseModel

  accessor :account_id, type: String
  accessor :name, type: String
  accessor :class, type: String
  accessor :code, type: String
  accessor :type, type: String
  accessor :status, type: String
  accessor :description, type: String
  accessor :tax_type, type: String
  accessor :enable_payments_to_account, type: Boolean
  accessor :show_in_expense_claims, type: Boolean
  accessor :system_account, type: String
  accessor :bank_account_number, type: String
  accessor :bank_account_type, type: String
  accessor :currency_code, type: String
  accessor :reporting_code, type: String
  accessor :reporting_code_name, type: String
  readonly :has_attachments, type: Boolean

end
