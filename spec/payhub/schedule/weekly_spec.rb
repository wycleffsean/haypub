require 'spec_helper'

module Payhub::Schedule
  RSpec.describe Weekly do
    include_examples 'schedule interval'

    let(:json) { load_json_fixture('weekly.json') }
    let(:days) { ['sun','WED', :sat] }
    let(:args) { Hash.new }
    let(:schedule) {
      Weekly.new(*days, args)
    }
    it 'builds valid json' do
      schedule_json = serialize(schedule)
      expect(JSON.load(schedule_json)).to eq JSON.load(json)
    end
  end
end
