class CalendarsController < ApplicationController
	before_action :authenticate_user!

	def index
		@calendars = current_user.calendars
	end

	def new
		@calendar = Calendar.new
	end

	def create
		@calendar = current_user.calendars.new(calendar_params)
		# MOVE THIS LOGICAL TO THE VIEW
		# nmonth = calendar_params[:months_in_year].
		# for i in 1..nmonth do |n|
		#		@calendar.months.build(calendar_params[:days_in_month]) <<<<<<<< attr_accessor!
		# end
		
		# create a calendar before building the months?

		if @calendar.save
			redirect_to new_calendar_path
			# calendar_params[:months_in_year].to_i.times { @calendar.months.build } # creates blank child records
		end
	end
	

	def edit
		@calendar = Calendar.find(params[:id])
	end


	def show
		@calendar = Calendar.find(params[:id])
	end

	def destroy
		@calendar.destroy
	end


	private

		def calendar_params
			params.require(:calendar).permit( :abbrev, :name, :leap, :leap_year_num, :months_in_year, :hours_in_day, :week_length, 
																				:days_in_week, :global_anchor, :global_scale, :days_in_month,
																				eras_attributes: [:abbrev, :name, :direction, :anchor],
																				months_attributes: [:id, :number, :abbrev, :name, :days_normal, :days_leap, :_destroy])
		end
end