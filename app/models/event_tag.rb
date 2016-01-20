class EventTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :event
end
