class Event < ActiveRecord::Base
  belongs_to :line
  has_many :arcs, through: :arc_events
  has_many :entities, through: :entity_events
  has_many :tags, through: :event_tags

end
