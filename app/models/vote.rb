class Vote
  include Mongoid::Document

  belongs_to :candidate
  belongs_to :voter

  validates_presence_of :candidate

end
