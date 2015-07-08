require 'rails_helper'

RSpec.describe Item, type: :model do
  specify { expect_it.to validate_presence_of :name }
  specify { expect_it.to belong_to :user }
  specify { expect_it.to belong_to :campaign }
end
