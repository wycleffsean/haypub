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
end
