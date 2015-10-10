require 'spec_helper'

describe Payhub do
  let(:api_key) { SecureRandom.uuid }
  let(:organization_id) { rand(10000..99999) }
  let(:terminal_id) { rand(100..999) }
  before {
    Payhub.api_key = api_key
    Payhub.organization_id = organization_id
    Payhub.terminal_id = terminal_id
  }

  it 'has a version number' do
    expect(Payhub::VERSION).not_to be nil
  end

  it('has an api_key') { expect(Payhub.api_key).to eq(api_key) }
  describe '.merchant' do
    it 'uses organization_id' do
      expect(Payhub.merchant.organization_id).to eq organization_id
    end
    it 'uses terminal_id' do
      expect(Payhub.merchant.terminal_id).to eq terminal_id
    end
  end

  describe 'Recurring Bills' do
    let(:recurring_bill_proc) {
      proc {
        bill(
          base_amount: 72.34,
          shipping_amount: 3.87,
          tax_amount: 7.23,
          note: "Gym stuff monthly delivered.",
          invoice_number: "FF7845742ARG",
          po_number: "What is a PO number?"
        )
        card_data(
          card_number: "4055011111111111",
          card_expiry_date: "201709",
          billing_address_1: "154 E 34th St",
          billing_address_2: "Fifth Floor",
          billing_city: "New York",
          billing_state: "NY",
          billing_zip: "10016"
        )
        customer(
          first_name: "Adam",
          last_name: "Smith",
          company_name: "Capital Inc",
          job_title: "President",
          email_address: "adam@smith.com",
          web_address: "http://capitalinc.com",
          phone_number: "(917) 479 1349",
          phone_ext: "5702",
          phone_type: "W"
        )
        #schedule Schedule::SpecificDates.new("2015-10-01", "2016-09-30")
      }
    }


    describe '.recurring_bill' do
      let(:recurring_bill) { Payhub.recurring_bill &recurring_bill_proc }
      it 'builds a recurring bill' do
        expect(recurring_bill).to be_a(Payhub::Transactions::RecurringBill)
      end
      it 'includes merchant' do
        expect(recurring_bill.merchant).to be_a(Payhub::Merchant)
      end
    end
  end
end
