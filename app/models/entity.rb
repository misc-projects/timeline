class Entity < ActiveRecord::Base
	has_many :events, through: :entity_events
end
