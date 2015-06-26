require 'rails_helper'

describe ExpirationMessage do
  subject { described_class.new(date) }

  before do
    Timecop.freeze(Time.local(2015, 01, 01))
  end

  after do
    Timecop.return
  end

  context 'campaign has ended already' do
    let(:date) { Date.new(2001, 03, 25) }
    specify { expect(subject.to_s).to include 'March 25, 2001' }
  end

  context 'campaign ends in days' do
    let(:date) { 3.days.from_now }
    specify { expect(subject.to_s).to include '3 days' }
  end

  context 'campaign ends in hours' do
    let(:date) { 21.hours.from_now }
    specify { expect(subject.to_s).to include '21 hours' }
  end

  context 'campaign ends in minutes' do
    let(:date) { 45.minutes.from_now }
    specify { expect(subject.to_s).to include '45 minutes' }
  end

  context 'campaign ends in seconds' do
    let(:date) { 45.seconds.from_now }
    specify { expect(subject.to_s).to include 'under a minute' }
  end
end
