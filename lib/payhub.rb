require 'virtus'
require 'payhub/version'
require 'payhub/hash_builder'
require 'payhub/merchant'
require 'payhub/amount'
require 'payhub/bill'
require 'payhub/card_data'
require 'payhub/customer'
require 'payhub/schedule'
require 'payhub/transactions/recurring_bill'

module Payhub
  SANDBOX_URI = URI('https://sandbox-api.payhub.com').freeze

  class << self
    extend Forwardable
    attr_accessor :api_key
    def_delegators :merchant, :organization_id=, :terminal_id=

    def recurring_bill(&block)
      hash = HashBuilder.new(&block).hash
      bill = Transactions::RecurringBill.new hash
      bill.merchant = merchant
      bill
    end

    def merchant
      @merchant ||= Merchant.new
    end
  end
end
