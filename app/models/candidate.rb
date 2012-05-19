class Candidate
  include Mongoid::Document
  field :name
  field :party

  belongs_to :constituency
  belongs_to :party

  alias_method :to_s, :name
  
end

