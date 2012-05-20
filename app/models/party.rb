class Party

  CODES = {
    'Con' => 'Conservative',
    'Lab' => 'Labour',
    'LD' => 'Lib-Dem',
    'SNP' => 'Scottish National Party',
    'PC' => 'Plaid Cymru',
    'Green' => 'Green Party',
    'BNP' => 'British National Party',
    'UKIP' => 'UK Independence Party',
    'Other' => 'Other'
  }

  include Mongoid::Document

  field :code, type: String
  field :name, type: String
  field :vote_count, type: Integer, default: 0 # simple counter cache

  has_many :candidates
  has_many :constituencies

  alias_method :to_s, :name

  def share_of_vote
    if vote_count > 0
      "%0.1f%%" % (100 * vote_count / Vote.count.to_f)
    else
      '-'
    end
  end

end
