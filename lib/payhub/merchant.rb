module Payhub
  class Merchant
    include Virtus.model

    attribute :organization_id, Integer
    attribute :terminal_id, Integer
  end
end
