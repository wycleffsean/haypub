module Payhub
  class Amount
    include Virtus.model

    attribute :amount, Float

    def initialize(val)
      self.amount = val
    end
  end
end
