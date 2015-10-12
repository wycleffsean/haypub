[![Build Status](https://travis-ci.org/wycleffsean/haypub.svg)](https://travis-ci.org/wycleffsean/haypub)
[![Code Climate](https://codeclimate.com/github/wycleffsean/haypub/badges/gpa.svg)](https://codeclimate.com/github/wycleffsean/haypub)
[![Test Coverage](https://codeclimate.com/github/wycleffsean/haypub/badges/coverage.svg)](https://codeclimate.com/github/wycleffsean/haypub/coverage)
[![security](https://hakiri.io/github/wycleffsean/haypub/master.svg)](https://hakiri.io/github/wycleffsean/haypub/master)

# Haypub

Haypub is a ruby gem for interacting with payhub with minimal effort.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'haypub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install haypub

## Usage

Set merchant and authorization token.  For example, in rails you would have something like...

```ruby
# config/initializers/payhub.rb
    Payhub.api_key = "bbcf327b-5653-4c01-b043-8e8a4bae9148"
    Payhub.organization_id = 12345
    Payhub.terminal_id = 123
```

### creating a recurring bill
```ruby
  Payhub.create_recurring_bill do
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
    schedule Schedule::SpecificDates.new("2015-10-01", "2016-09-30")
  end
```

### Monthly Scheduling

Bill on the 1st and 15th of every month

```ruby
  Payhub.create_recurring_bill do
    ...
    schedule Schedule::Monthly.new(:E, 1, 15)
  end
```

Bill on the 3rd Sunday of every month

```ruby
  Payhub.create_recurring_bill do
    ...
    schedule Schedule::Monthly.new(:O, 3, :sunday)
  end
```

### Weekly Scheduling

Bill on Monday and Friday every week

```ruby
  Payhub.create_recurring_bill do
    ...
    schedule Schedule::Weekly.new(:mon, :fri)
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To test against the PayHub sandbox create a `.env` file in the repository root with the following information

```
PAYHUB_API_KEY={payhub oauth token}
PAYHUB_ORGANIZATION_ID={organization id}
PAYHUB_TERMINAL_ID={terminal id}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wycleffsean/haypub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

