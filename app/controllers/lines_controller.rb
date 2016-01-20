class LinesController < ApplicationController
	# consider adding accepts_nested_attributes_for :calendar in model
	def index
		@lines = current_user.lines
	end

	def new
		@line = Line.new
	end

	def create
		@line = current_user.lines.new(line_params)

		set_default_calendar

		if @line.save
			redirect_to line_path(id: @line.id)
		end
	end
	
	def show
		@line = Line.find(params[:id])
	end

	def destroy
		@line.destroy
	end


	private

		def line_params
			params.require(:line).permit(:name)
		end

		def set_default_calendar
			calendar_name = params[:calendar]
			@line.calendar = current_user.calendars.find_by name: calendar_name
		end

end
