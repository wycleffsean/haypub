require 'spec_helper'

module Payhub
  describe Transactions::RecurringBill do
    let(:merchant) { Merchant.new organization_id: 10005, terminal_id: 5 }
    let(:bill) {
      Bill.new(
       base_amount: 72.34,
       shipping_amount: 3.87,
       tax_amount: 7.23,
       note: "Gym stuff monthly delivered.",
       invoice_number: "FF7845742ARG",
       po_number: "What is a PO number?"
      )
    }
    let(:card_data) {
      CardData.new(
        card_number: "4055011111111111",
        card_expiry_date: "201709",
        billing_address_1: "154 E 34th St",
        billing_address_2: "Fifth Floor",
        billing_city: "New York",
        billing_state: "NY",
        billing_zip: "10016"
      )
    }
    let(:customer) {
      Customer.new(
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
    }
    let(:schedule) {
      Schedule::SpecificDates.new(
        schedule_type: "S",
        specific_dates_schedule: {
          specific_dates: [
            "2015-10-01",
            "2016-09-30"
          ]
        }
      )
      Schedule::SpecificDates.new("2015-10-01", "2016-09-30")
    }
    subject {
      Transactions::RecurringBill.new(
        merchant: merchant,
        bill: bill,
        card_data: card_data,
        customer: customer,
        schedule: schedule
      ) 
    }
    let(:recurring_bill_json) { load_json_fixture('recurring_bill_post.json') }

    it 'builds json' do
      subject_json = serialize(subject)
      expect(JSON.load(subject_json)).to eq JSON.load(recurring_bill_json)
    end
  end
end
