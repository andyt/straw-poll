class Candidate
  include Mongoid::Document
  field :name
  field :party

  belongs_to :constituency
  belongs_to :party

  alias_method :to_s, :name

  def name_and_party
    "%s (%s)" % [name, party.name]
  end
  
end

