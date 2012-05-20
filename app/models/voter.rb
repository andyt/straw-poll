class Voter
  include Mongoid::Document

  field :intends_to_vote, type: Boolean, default: nil
  
  has_one :vote
  belongs_to :constituency

  validates_presence_of :constituency_id, :message => 'Please choose your constituency.'
  validates_inclusion_of :intends_to_vote, :in => [true, false], :message => 'Please specify whether you intend to vote.'


end
