class CalendarsController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def new
		@calendar = Calendar.new
		@calendar.eras.build direction: 1, anchor: 0
		# find a way to disable changes to direction and remove the buttons
	end

	def create
		@calendar = current_user.calendars.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render action: 'create', status: :created, location: @calendar }
        format.js   { render action: 'create', status: :created, location: @calendar }
      else
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
        format.js { render json: { model: 'calendar', error: @calendar.errors }, status: :unprocessable_entity }
      end
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
																			 	:global_anchor, :global_scale, :days_in_month,
																			 	days_in_week: [],
																				eras_attributes: [:number, :abbrev, :name, :direction, :anchor],
																				months_attributes: [:id, :number, :abbrev, :name, :days_normal, :days_leap, :_destroy])
		end
end