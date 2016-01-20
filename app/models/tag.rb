class Tag < ActiveRecord::Base
	has_many :events, through: :event_tags
end
