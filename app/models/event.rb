class Event < ActiveRecord::Base
  
  belongs_to :line

  has_many :arcs, through: :arc_events
  has_many :arc_events

  has_many :entities, through: :entity_events
  has_many :entity_events

  has_many :tags, through: :event_tags
  has_many :event_tags

  accepts_nested_attributes_for :arcs, :entities, :tags,
                                :arc_events, :entity_events, :event_tags

  attr_accessor :start_era_id, :all_tags
  cattr_accessor :current_user

  validates :line_id, presence: true

  def start_era_id=(id)
  	era = Era.find(id)
  	self.start_era = era.number
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create(user_id: current_user.id)
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
  
end
