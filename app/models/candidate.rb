class Candidate
  include Mongoid::Document
  field :name
  field :party

  belongs_to :constituency
  belongs_to :party
  has_many :votes

  alias_method :to_s, :name

  def name_and_party
    "%s (%s)" % [name, party.name]
  end

  def share_of_vote
    if constituency.vote_count > 0
      "%0.1f%%" % (100 * votes.count / constituency.vote_count.to_f)
    else
      '-'
    end
  end

  def vote_count
    @vote_count ||= votes.count
  end
  
end

