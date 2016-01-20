class Line < ActiveRecord::Base
	belongs_to :calendar
	belongs_to :user
	has_many :events

end
