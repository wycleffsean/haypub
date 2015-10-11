require 'spec_helper'

module Payhub::Schedule
  RSpec.describe Monthly do
    context "monthly - 'on the'" do
      let(:json) { load_json_fixture('monthly_on_the.json') }
      let(:week) { 5 }
      let(:day) { 7 }
      let(:schedule) {
        Monthly.new(:O, week, day)
      }
      it 'builds valid json' do
        schedule_json = serialize(schedule)
        expect(JSON.load(schedule_json)).to eq JSON.load(json)
      end
      context 'week out of range' do
        let(:week) { 6 }
        it do
          expect{ schedule }.to raise_error(ArgumentError)
        end
      end
      context 'day out of range' do
        let(:day) { 8 }
        it do
          expect{ schedule }.to raise_error(ArgumentError)
        end
      end
    end

    context "monthly - 'every'" do
      let(:json) { load_json_fixture('monthly_each.json') }
      let(:first) { 1 }
      let(:second) { 32 }
      let(:schedule) {
        Monthly.new(:E, first, second)
      }
      it 'builds valid json' do
        schedule_json = serialize(schedule)
        expect(JSON.load(schedule_json)).to eq JSON.load(json)
      end
      context 'day out of range' do
        let(:second) { 33 }
        it do
          expect{ schedule }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
