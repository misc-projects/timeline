class EventsController < ApplicationController
	before_action :authenticate_user!

	def new
		@line = Line.find(params[:line_id])
		@eras = @line.calendar.eras
	end

	def create
		@line = Line.find(params[:line_id])
		@event = @line.events.new(event_params)
		
		respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'event was successfully created.' }
        format.json { render action: 'create', status: :created, location: @event }
        format.js   { render action: 'create', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js { render json: @event.errors, status: :unprocessable_entity }
      end
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	private

		def event_params
			params.require(:event).permit( :name, :start_era_id, :start_year, :end_year, 
																			:start_month, :end_month, :start_date, :end_date,
																			:day, :hour, :summary, :detail, :level, :type, :complete,
																			:all_tags, :all_arcs, :all_entities,
																			arcs_attributes: [],
																			arc_events_attributes: [],
																			entities_attributes: [],
																			entity_events_attributes: [],
																			tags_attributes: [:user_id, :name],
																			event_tags_attributes: [])
		end

end
