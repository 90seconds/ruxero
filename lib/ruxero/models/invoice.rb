class Ruxero::Invoice < Ruxero::BaseModel

  accessor :type, type: String
  accessor :date, type: Date
  accessor :due_date, type: Date
  accessor :line_amount_types, type: String
  accessor :invoice_number, type: String
  accessor :reference, type: String
  accessor :branding_theme_id, type: String
  accessor :url, type: String
  accessor :currency_code, type: String
  accessor :currency_rate, type: Float
  accessor :status, type: String
  accessor :sub_total, type: Float
  accessor :total_tax, type: Float
  accessor :total, type: Float
  readonly :invoice_id, type: String
  readonly :amount_due, type: Float
  readonly :amount_paid, type: Float
  readonly :amount_credited, type: Float
  readonly :fully_paid_on_date, type: Date
  readonly :updated_date_utc, type: Time
  readonly :sent_to_contact, type: Boolean
  accessor :contact, type: lambda { Ruxero::Contact }
  readonly :payments, type: lambda { Ruxero::Payment }, collection: true

  def self.download(invoice_id)
    path = "/api.xro/2.0/Invoices/#{invoice_id}"
    headers = { :format => :pdf }
    Ruxero.application.get(path, headers)
  end

  def sent_to_contact?
    self.sent_to_contact || false
  end

  def fully_paid?
    status == 'PAID'
  end

end
