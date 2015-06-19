require 'rails_helper'

describe NullUser do
  it 'is not an admin' do
    expect(subject.admin?).to eq(false)
  end

  it 'has a nil email address' do
    expect(subject.email).to eq(nil)
  end
end
