module Payhub
  class Customer
    include Virtus.model

    attribute :first_name, String
    attribute :last_name, String
    attribute :company_name, String
    attribute :job_title, String
    attribute :email_address, String
    attribute :web_address, String
    attribute :phone_number, String
    attribute :phone_ext, String
    attribute :phone_type, String
  end
end
