require_relative '../spec_helper'

describe Constituency do
  it { should have_many(:candidates) }
  it { should belong_to(:party) }
end
