module Payhub
  class Bill
    include Virtus.model

    attribute :base_amount, Amount
    attribute :shipping_amount, Amount
    attribute :tax_amount, Amount
    attribute :note, String
    attribute :invoice_number, String
    attribute :po_number, String
  end
end
