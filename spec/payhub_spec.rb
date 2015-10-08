require 'spec_helper'

describe Payhub do
  let(:api_key) { SecureRandom.uuid }
  before { Payhub.api_key = api_key }

  it 'has a version number' do
    expect(Payhub::VERSION).not_to be nil
  end

  it('has an api_key') { expect(Payhub.api_key).to eq(api_key) }

  describe '.create_recurring_bill' do
    before do
      Payhub.create_recurring_bill do
      end
    end
    it 'sets authorization header' do
      expect(a_request(:post, Payhub::SANDBOX_URI.to_s).
         with(headers: {'Authorization' => "Bearer #{api_key}"})).
           to have_been_made.once
    end
  end
end
