class Constituency
  include Mongoid::Document

  field :pa_id, type: Integer
  field :name, type: String
  field :parameter, type: String
  field :region, type: String

  belongs_to :party
  has_many :candidates
  has_many :voters

  def to_param
    parameter
  end

  def candidates_by_vote_count
    @candidates_by_vote_count ||= candidates.includes(:party).sort_by { |c| c.vote_count }.reverse
  end

  def leading_candidate
    candidates_by_vote_count.first if candidates_by_vote_count.first.vote_count > candidates_by_vote_count.second.vote_count
  end

  def votes
    candidates.collect { |c| c.votes }.flatten
  end

  def vote_count
    candidates.map { |c| c.votes.count }.sum
  end

  def voters_abstaining_count
    voters.where(:intends_to_vote => false).count
  end

end
