class Event < ActiveRecord::Base
  belongs_to :line
  has_many :arcs, through: :arc_events
  has_many :entities, through: :entity_events
  has_many :tags, through: :event_tags

  accepts_nested_attributes_for :arcs, :entities, :tags

  attr_accessor :start_era_id

  def start_era_id=(id)
  	era = Era.find(id)
  	self.start_era = era.number
  end

end
