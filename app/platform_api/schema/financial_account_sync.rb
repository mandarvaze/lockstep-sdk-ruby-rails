class Schema::FinancialAccountSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The code for the Financial Account. Can either be a general ledger or
  # an account code.
  # @type: string
  field :code

  # The External Id for the Financial Account.
  # @type: string
  field :erp_key

  # The name of the Financial Account.
  # @type: string
  field :name

  # The status of the Financial Account. Possible values are active,
  # inactive, deleted or archived.
  # @type: string
  field :status

  # The cashflow type for the Financial Account. Examples include cash, financing, investment
  # or operation.
  # @type: string
  field :cashflow_type

  # The description for the Financial Account.
  # @type: string
  field :description

  # The classification for the Financial Account. Possible values are Asset, Equity,
  # Expense, Liability or Income.
  # @type: string
  field :classification

  # The category for the Financial Account. Examples include Current Asset, Current Liability, Common Stock
  # @type: string
  field :category

  # The subcategory for the Financial Account. Examples include Cash, Property, Bank Loan, etc.
  # @type: string
  field :subcategory



end