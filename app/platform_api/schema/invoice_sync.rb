class Schema::InvoiceSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # This is the primary key of the Invoice record. For this field, you should use whatever the invoice's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your invoice records in a database, whatever the primary key for the invoice table is
  # in the database should be the "ErpKey".
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The original primary key or unique ID of the company to which this invoice belongs.  This value should
  # match the [Company ErpKey](https://developer.lockstep.io/docs/importing-companies#erpkey) field on the
  # [CompanySyncModel](https://developer.lockstep.io/docs/importing-companies).
  #             
  # An Invoice has two relationships: The Company and the Customer.  The field `CompanyErpKey` identifies the
  # company that created the invoice, and the field `CustomerErpKey` is the customer to whom the invoice
  # was sent.
  # @type: string
  field :company_erp_key

  # The original primary key or unique ID of the company to which this invoice was sent.  This value should
  # match the [Company ErpKey](https://developer.lockstep.io/docs/importing-companies#erpkey) field on the
  # [CompanySyncModel](https://developer.lockstep.io/docs/importing-companies).
  #             
  # An Invoice has two relationships: The Company and the Customer.  The field `CompanyErpKey` identifies the
  # company that created the invoice, and the field `CustomerErpKey` is the customer to whom the invoice
  # was sent.
  # @type: string
  field :customer_erp_key

  # The name of the salesperson that wrote this invoice.  This is just text, it is not a reference to the
  # "Contacts" table.  You will not receive an error if this field does not match a known contact person.
  # @type: string
  field :salesperson_name

  # The "Purchase Order Code" is a code that is sometimes used by companies to refer to the original PO
  # that was sent that caused this invoice to be written.  If a customer sends a purchase order to a vendor,
  # the vendor can then create an invoice and refer back to the originating purchase order using this field.
  # @type: string
  field :purchase_order_code

  # An additional reference code that is sometimes used to identify this invoice. The meaning of this field
  # is specific to the ERP or accounting system used by the user.
  # @type: string
  field :reference_code

  # A code identifying the salesperson responsible for writing this quote, invoice, or order.  This is just
  # text, it is not a reference to the "Contacts" table.  You will not receive an error if this field does
  # not match a known contact person.
  # @type: string
  field :salesperson_code

  # A code identifying the type of this invoice.
  #             
  # Recognized Invoice types are:
  # * `AR Invoice` - Represents an invoice sent by Company to the Customer
  # * `AP Invoice` - Represents an invoice sent by Vendor to the Company
  # * `AR Credit Memo` - Represents a credit memo generated by Company given to Customer
  # * `AP Credit Memo` - Represents a credit memo generated by Vendor given to Company
  # @type: string
  field :invoice_type_code

  # A code identifying the status of this invoice.
  #             
  # Recognized Invoice status codes are:
  # * `Open` - Represents an invoice that is considered open and needs more work to complete
  # * `Closed` - Represents an invoice that is considered closed and resolved
  # @type: string
  field :invoice_status_code

  # A code identifying the terms given to the purchaser.  This field is imported directly from the originating
  # financial system and does not follow a specified format.
  # @type: string
  field :terms_code

  # If the customer negotiated any special terms different from the standard terms above, describe them here.
  # @type: string
  field :special_terms

  # The three-character ISO 4217 currency code used for this invoice.
  # @type: string
  field :currency_code

  # The total value of this invoice, inclusive of all taxes and line items.
  # @type: number
  # @format: double
  field :total_amount

  # The total sales (or transactional) tax calculated for this invoice.
  # @type: number
  # @format: double
  field :sales_tax_amount

  # The total discounts given by the seller to the buyer on this invoice.
  # @type: number
  # @format: double
  field :discount_amount

  # The remaining balance value of this invoice.
  # @type: number
  # @format: double
  field :outstanding_balance_amount

  # The reporting date for this invoice.
  # @type: string
  # @format: date-time
  field :invoice_date, Types::Params::DateTime

  # The date when discounts were adjusted for this invoice.
  # @type: string
  # @format: date-time
  field :discount_date, Types::Params::DateTime

  # The date when this invoice posted to the company's general ledger.
  # @type: string
  # @format: date-time
  field :posted_date, Types::Params::DateTime

  # The date when the invoice was closed and finalized after completion of all payments and delivery of all products and
  # services.
  # @type: string
  # @format: date-time
  field :invoice_closed_date, Types::Params::DateTime

  # The date when the remaining outstanding balance is due.
  # @type: string
  # @format: date-time
  field :payment_due_date, Types::Params::DateTime

  # The date and time when this record was imported from the user's ERP or accounting system.
  # @type: string
  # @format: date-time
  field :imported_date, Types::Params::DateTime

  # The origination address for this invoice
  # @type: string
  field :origin_address_line1

  # The origination address for this invoice
  # @type: string
  field :origin_address_line2

  # The origination address for this invoice
  # @type: string
  field :origin_address_line3

  # The origination address for this invoice
  # @type: string
  field :origin_address_city

  # The origination address for this invoice
  # @type: string
  field :origin_address_region

  # The origination address for this invoice
  # @type: string
  field :origin_address_postal_code

  # The origination address for this invoice
  # @type: string
  field :origin_address_country

  # The origination address for this invoice
  # @type: number
  # @format: float
  field :origin_address_latitude

  # The origination address for this invoice
  # @type: number
  # @format: float
  field :origin_address_longitude

  # The billing address for this invoice
  # @type: string
  field :bill_to_address_line1

  # The billing address for this invoice
  # @type: string
  field :bill_to_address_line2

  # The billing address for this invoice
  # @type: string
  field :bill_to_address_line3

  # The billing address for this invoice
  # @type: string
  field :bill_to_address_city

  # The billing address for this invoice
  # @type: string
  field :bill_to_address_region

  # The billing address for this invoice
  # @type: string
  field :bill_to_address_postal_code

  # The billing address for this invoice
  # @type: string
  field :bill_to_address_country

  # The billing address for this invoice
  # @type: number
  # @format: float
  field :bill_to_address_latitude

  # The billing address for this invoice
  # @type: number
  # @format: float
  field :bill_to_address_longitude

  # The shipping address for this invoice
  # @type: string
  field :ship_to_address_line1

  # The shipping address for this invoice
  # @type: string
  field :ship_to_address_line2

  # The shipping address for this invoice
  # @type: string
  field :ship_to_address_line3

  # The shipping address for this invoice
  # @type: string
  field :ship_to_address_city

  # The shipping address for this invoice
  # @type: string
  field :ship_to_address_region

  # The shipping address for this invoice
  # @type: string
  field :ship_to_address_postal_code

  # The shipping address for this invoice
  # @type: string
  field :ship_to_address_country

  # The shipping address for this invoice
  # @type: number
  # @format: float
  field :ship_to_address_latitude

  # The shipping address for this invoice
  # @type: number
  # @format: float
  field :ship_to_address_longitude

  # If known, the date when this record was created according to the originating financial system
  # in which this record is maintained.  If the originating financial system does not maintain a
  # created-date, leave this field null.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # If known, the date when this record was most recently modified according to the originating
  # financial system in which this record is maintained.  If the originating financial system does
  # not maintain a most-recently-modified-date, leave this field null.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # Is the invoice voided? If not specified, we assume the invoice is not voided.
  # @type: boolean
  field :is_voided

  # Is the invoice in dispute? If not specified, we assume the invoice is not in dispute.
  # @type: boolean
  field :in_dispute

  # Indicates the preferred delivery method for this invoice. Examples include Print, Email, Fax
  # @type: string
  field :preferred_delivery_method



end