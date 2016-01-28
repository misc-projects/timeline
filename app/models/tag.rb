class Tag < ActiveRecord::Base
	has_many :events, through: :event_tags
	belongs_to :line
end
