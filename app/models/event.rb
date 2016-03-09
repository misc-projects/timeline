class Event < ActiveRecord::Base
  
  belongs_to :line, inverse_of: :events

  has_many :arcs, through: :arc_events
  has_many :arc_events

  has_many :entities, through: :entity_events
  has_many :entity_events

  has_many :tags, through: :event_tags
  has_many :event_tags

  accepts_nested_attributes_for :arcs, :entities, :tags,
                                :arc_events, :entity_events, :event_tags

  attr_accessor :start_era_id, :all_tags
  cattr_accessor :current_user

  validates :line, presence: true
  validates :line_id, presence: true
  validates :name, presence: true
  validates :start_era, presence: true
  validates :start_year, presence: true
  validates :start_month, numericality: { greater_than: 0 }

  after_validation :check_dates

  def start_era_id=(id)
  	era = Era.find(id)
  	self.start_era = era.number
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create(user_id: current_user.id)
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
  
  private

  # TODO DRY
  # TODO LEAP YEARS
    def check_dates
      calendar = Line.find(self.line_id).calendar
      if self.start_month.nil? 
        unless self.start_date.nil?
          errors.add(:start_date, "can't be filled if month is empty")
        end   
      else
        if self.start_month <= calendar.months.count
          unless self.start_date <= max_days = calendar.months.find_by(number: self.start_month).days_normal
            errors.add(:start_date, "can't exceed number of days in the month (#{max_days})")
          end
        else
          errors.add(:start_month, "can't be greater than number of months (#{calendar.months.count})")
        end

      end

      if self.end_month.nil? 
        unless self.end_date.nil?
          errors.add(:end_date, "can't be filled if month is empty")
          errors.add(:end_month, "must not be empty")
        end   
      else
        if self.end_year.nil?
          errors.add(:end_month, "can't be filled if year is empty")
          errors.add(:end_year, "must not be empty")
        end

        if self.end_month <= calendar.months.count
          unless self.end_date <= max_days = calendar.months.find_by(number: self.end_month).days_normal
            errors.add(:end_date, "can't exceed number of days in the month (#{max_days})")
          end
        else
          errors.add(:end_month, "can't be greater than number of months (#{calendar.months.count})")
        end
        
      end

    end

end
