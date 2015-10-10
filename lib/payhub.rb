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
    attr_accessor :api_key

    def create_recurring_bill
      Net::HTTP.post_form(url, {})
    end

    private

    def url
      SANDBOX_URI
    end
  end
end
