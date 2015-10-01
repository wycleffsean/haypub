module Payhub
  module Transactions
    class RecurringBill
      include Virtus.model

      attribute :merchant, Merchant
      attribute :bill, Bill
      attribute :card_data, CardData
      attribute :customer, Customer
      attribute :schedule, Schedule
    end
  end
end
