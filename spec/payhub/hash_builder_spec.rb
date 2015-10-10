require 'spec_helper'

module Payhub
  describe HashBuilder do
    let(:hash) do
      HashBuilder.new do
        key arg1: 1, arg2: 2
      end.hash
    end
    let(:value){ Hash[:arg1, 1, :arg2, 2] }

    it('creates key') { expect(hash.key?(:key)).to be true }
    it('sets value') { expect(hash[:key]).to eq value }
  end
end
