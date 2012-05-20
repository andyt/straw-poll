class Vote
  include Mongoid::Document

  belongs_to :candidate
  belongs_to :voter

  validates_presence_of :candidate

  delegate :constituency, :to => :candidate

  after_save :increment_party_vote_count

  private

  def increment_party_vote_count
    candidate.party.inc(:vote_count, 1)
  end

end
