class Arc < ActiveRecord::Base
  belongs_to :line
  has_many :events, through: :arc_events
end
