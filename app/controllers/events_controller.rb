class EventsController < ApplicationController
	before_action :authenticate_user!

	def new
		@line = Line.find(params[:line_id])
		@eras = @line.calendar.eras
		@arcs = @line.arcs
		@entities = @line.entities
		@tags = current_user.tags
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
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js { render json: { model: 'event', error: @event.errors }, status: :unprocessable_entity }
      end
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	private

		def event_params
			params.require(:event).permit( :line_id, :name, :start_era_id, :start_year, :end_year, 
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
