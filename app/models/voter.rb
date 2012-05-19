class Voter
  include Mongoid::Document

  field :intends_to_vote, type: Boolean, default: nil
  has_one :vote

end
