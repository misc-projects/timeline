class Line < ActiveRecord::Base
	belongs_to :calendar
	belongs_to :user
	has_many :events, inverse_of: :line
	accepts_nested_attributes_for :events
	has_many :arcs
	has_many :entities

	validates :name, presence: true
	validates_associated :calendar
end
