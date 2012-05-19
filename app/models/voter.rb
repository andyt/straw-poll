class Voter
  include Mongoid::Document

  field :intends_to_vote, type: Boolean, default: nil
  
  has_one :vote
  belongs_to :constituency

  validates_presence_of :intends_to_vote, :constituency

end
