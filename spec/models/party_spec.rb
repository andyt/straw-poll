require_relative '../spec_helper'

describe Party do
  it { should have_many(:candidates) }
  it { should have_many(:constituencies) }
end
