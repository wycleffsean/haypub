module Payhub
  class CardData
    include Virtus.model

    attribute :card_number, String
    attribute :card_expiry_date, Date
    attribute :billing_address_1, String
    attribute :billing_address_2, String
    attribute :billing_city, String
    attribute :billing_state, String
    attribute :billing_zip, String
  end
end
