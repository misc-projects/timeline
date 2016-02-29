class Line < ActiveRecord::Base
	belongs_to :calendar
	belongs_to :user
	has_many :events
	has_many :arcs
	has_many :entities
	has_many :tags

	validates :name, presence: true
	validates_associated :calendar
end
