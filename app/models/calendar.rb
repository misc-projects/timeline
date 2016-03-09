class Calendar < ActiveRecord::Base
	has_many :months
	has_many :eras
	has_many :lines

	belongs_to :user

	validates :name, presence: true
	validate do
    check_months_number
    check_eras_number
  end

	accepts_nested_attributes_for :eras, :months, allow_destroy: true


	attr_accessor :days_in_month

  private

  # TODO DRY

  	def months_count_valid?
      months.reject(&:marked_for_destruction?).count >= 1
    end

    def check_months_number
      unless months_count_valid?
        errors.add(:months_in_year, "need at least 1 month")
      end
    end


    def eras_count_valid?
      eras.reject(&:marked_for_destruction?).count >= 1
    end

    def check_eras_number
      unless eras_count_valid?
        errors.add(:eras, "need at least 1 era")
      end
    end
end
