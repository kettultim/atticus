require "rails_helper"

describe Campaign do
  it { should validate_presence_of :title }
  it { should validate_presence_of :details }

  it { should belong_to :user }
end
