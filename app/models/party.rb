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

  has_many :candidates
  has_many :constituencies
end
