require_relative '../spec_helper'

describe Voter do
  it { should have_one(:vote) }
  it { should have_field(:intends_to_vote).of_type(Boolean).with_default_value_of(nil) }
end
