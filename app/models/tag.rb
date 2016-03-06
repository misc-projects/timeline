class Tag < ActiveRecord::Base
	has_many :events, through: :event_tags
	has_many :event_tags
	belongs_to :user
end
