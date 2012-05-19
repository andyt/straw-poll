class Constituency
  include Mongoid::Document

  field :pa_id, type: Integer
  field :name, type: String
  field :region, type: String

  belongs_to :party
  has_many :candidates

  alias_method :to_s, :name

end
