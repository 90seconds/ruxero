class Ruxero::Contact < Ruxero::BaseModel

  readonly :contact_id, :type => String, :xml_node => 'ContactID'
  accessor :contact_status, :type => String
  accessor :name, :type => String
  accessor :first_name, :type => String
  accessor :last_name, :type => String
  accessor :email_address, :type => String
  accessor :bank_account_details, :type => String
  accessor :tax_number, :type => String
  accessor :accounts_receivable_tax_type, :type => String
  accessor :accounts_payable_tax_type, :type => String
  # accessor :addresses, :type => Ruxero::Address
  # accessor :phones, :type => Ruxero::Phone
  readonly :updated_date_utc, :type => Time, :xml_node => 'UpdatedDateUTC'
  # accessor :contact_groups, :type => Ruxero::ContactGroup
  accessor :is_supplier, :type => Boolean
  accessor :is_customer, :type => Boolean
  accessor :default_currency, :type => String

end
