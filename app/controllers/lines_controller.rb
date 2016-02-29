class LinesController < ApplicationController
	before_action :authenticate_user!

	# consider adding accepts_nested_attributes_for :calendar in model
	def index
		@lines = current_user.lines
	end

	def new
		@line = Line.new
		@calendars = current_user.calendars
	end

	def create
		@line = current_user.lines.new(line_params)

		respond_to do |format|
      if @line.save
        format.html { redirect_to @line, notice: 'Timeline was successfully created.' }
        format.json { render action: 'create', status: :created, location: @line }
        format.js   { render action: 'create', status: :created, location: @line }
      else
        format.html { render action: 'new' }
        format.json { render json: @line.errors, status: :unprocessable_entity }
        format.js { render status: :unprocessable_entity } # this also has action: 'create', so it sends create.js.haml to the DOM
      end
		end
	end
	
	def show
		@line = Line.find(params[:id])
		@events = @line.events
		@arcs = @line.arcs
		@entities = @line.entities
		@tags = @line.tags
	end

	def events_data
		respond_to do |format|
     	format.json { render json: events_jsonify }
   	end
			# ID - year - name
	end


=begin
this will connect to the d3.js AJAX request

	def data
		respond_to do |format|
      format.json {
        render json:  @line.to_json(include: { event: { only: [:name, :summary] }})
      }
    end
	end
=end
  
	def destroy
		@line.destroy
	end


	private


		def events_jsonify
			# @events
			#     t.integer  "start_year"
    	# 		t.integer  "end_year"
    	# 		t.integer  "start_month"
    	# 		t.integer  "end_month"
    	# 		t.integer  "start_date"
    	# 		t.integer  "end_date"
		end

		def line_params
			params.require(:line).permit(:name, :calendar_id)
		end
		
end
