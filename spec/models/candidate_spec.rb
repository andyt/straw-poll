require_relative '../spec_helper'

describe Candidate do
  it { should belong_to(:party) }
  it { should belong_to(:constituency) }
  it { should have_many(:votes) }
end
