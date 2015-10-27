RSpec.shared_examples 'schedule interval' do
  it { expect(schedule.bill_generation_interval).to eq 1 }
  context 'bill_generation_interval option' do
    let(:args) { Hash[:bill_generation_interval, 3] }
    it { expect(schedule.bill_generation_interval).to eq 3 }
  end
end
