class Ruxero::Payment < Ruxero::BaseModel

  accessor :payment_id, type: String
  accessor :date, type: Date
  accessor :currency_rate, type: Float
  accessor :amount, type: Float
  accessor :reference, type: String
  accessor :is_reconciled, type: Boolean
  accessor :status, type: String
  accessor :payment_type, type: String
  accessor :updated_date_utc, type: Date
  accessor :invoice, type: lambda { Ruxero::Invoice }
  # accessor :credit_note, type: lambda { Ruxero::CreditNote }
  # accessor :prepayment, type: lambda { Ruxero::Prepayment }
  # accessor :overpayment, type: lambda { Ruxero::Overpayment }
  accessor :account, type: lambda { Ruxero::Account }

end
