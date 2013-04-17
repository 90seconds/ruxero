class Ruxero::Invoice < Ruxero::BaseModel

  accessor :type, :type => String
  accessor :contact, :type => Ruxero::Contact
  accessor :date, :type => Date
  accessor :due_date, :type => Date
  accessor :line_amount_types, :type => String
  accessor :invoice_number, :type => String
  accessor :reference, :type => String
  accessor :branding_theme_id, :type => String, :xml_node => 'BrandingThemeID'
  accessor :url, :type => String
  accessor :currency_code, :type => String
  accessor :status, :type => String
  accessor :sub_total, :type => Float
  accessor :total_tax, :type => Float
  accessor :total, :type => Float
  readonly :invoice_id, :type => String, :xml_node => 'InvoiceID'
  # readonly :payments, :type => Ruxero::Payment
  readonly :amount_due, :type => Float
  readonly :amount_paid, :type => Float
  readonly :amount_credited, :type => Float
  readonly :updated_date_utc, :type => Time, :xml_node => 'UpdatedDateUTC'
  readonly :sent_to_contact, :type => Boolean

  def self.download(invoice_id)
    path = "/api.xro/2.0/Invoices/#{invoice_id}"
    headers = { :format => :pdf }
    Ruxero.application.get(path, headers)
  end

  def sent_to_contact?
    self.sent_to_contact || false
  end

  def paid?
    self.amount_paid == self.total
  end

end
