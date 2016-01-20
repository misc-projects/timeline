class ArcEvent < ActiveRecord::Base
  belongs_to :arc
  belongs_to :event
end
