class CalendarsController < ApplicationController
	def index
		@calendars = current_user.calendars
	end

	def new
		@calendar = Calendar.new
	end

	def create
		@calendar = current_user.calendars.new(calendar_params)

		if @calendar.save
			redirect_to line_path(id: @calendar.id)
		end
	end
	
	def show
		@calendar = Calendar.find(params[:id])
	end

	def destroy
		@calendar.destroy
	end


	private

		def line_params
			params.require(:calendar).permit(:abbrev, :name)
		end

		def set_default_calendar
			calendar_name = params[:calendar]
			@line.calendar = current_user.calendars.find_by name: calendar_name
		end

end
