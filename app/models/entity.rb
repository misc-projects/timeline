class Entity < ActiveRecord::Base
	has_many :events, through: :entity_events
	belongs_to :line
end
