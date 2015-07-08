require 'rails_helper'

describe ApplicationPolicy do
  subject { described_class.new('user', 'record') }

  specify { expect(subject.index?).to eq(false) }
  specify { expect(subject.new?).to eq(false) }
  specify { expect(subject.create?).to eq(false) }
  specify { expect(subject.edit?).to eq(false) }
  specify { expect(subject.update?).to eq(false) }
  specify { expect(subject.destroy?).to eq(false) }

  describe ApplicationPolicy::Scope do
    subject { described_class.new('user', 'scope') }

    specify { expect(subject.resolve).to eq 'scope' }
    specify { expect(subject.user).to eq('user') }
    specify { expect(subject.scope).to eq('scope') }
  end
end
