class RoutineInterviewsController < ApplicationController
  # GET /routine_interviews
  # GET /routine_interviews.json
  def index
    @routine_interviews = RoutineInterview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routine_interviews }
    end
  end

  # GET /routine_interviews/1
  # GET /routine_interviews/1.json
  def show
    @routine_interview = RoutineInterview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @routine_interview }
    end
  end

  # GET /routine_interviews/new
  # GET /routine_interviews/new.json
  def new
    @interview = Interview.new
    @routine_interview = RoutineInterview.new
    schedule_entry = ScheduleEntry.find_by_id(params[:schedule_entry_id])
    @interview.student_id = schedule_entry.student_id
    @interview.period_id = schedule_entry.period_id
    @interview.user_id = schedule_entry.user_id
    @interview.interview_type_id = schedule_entry.interview_type_id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @routine_interview }
    end
  end

  # GET /routine_interviews/1/edit
  def edit
    @routine_interview = RoutineInterview.find(params[:id])
    @interview = @routine_interview.interview

    if !@interview.is_draft
      redirect_to @routine_interview
      flash[:notice] = "Not allowed to edit a non-draft interview"
    end

    respond_to do |format|
      format.html
    end
  end

  # POST /routine_interviews
  # POST /routine_interviews.json
  def create
    @interview = Interview.new(params[:interview])
    @routine_interview = RoutineInterview.new(params[:routine_interview])
    @routine_interview.interview = @interview

    respond_to do |format|
      if @routine_interview.save
        format.html { redirect_to @routine_interview, notice: 'Followup interview was successfully created.' }
        format.json { render json: @routine_interview, status: :created, location: @routine_interview }
      else
        format.html { render action: "new" }
        format.json { render json: @routine_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routine_interviews/1
  # PUT /routine_interviews/1.json
  def update
    @routine_interview = RoutineInterview.find(params[:id])
    @interview = Interview.find(@routine_interview.interview_id)

    respond_to do |format|
      if @routine_interview.update_attributes(params[:routine_interview]) && @interview.update_attributes(params[:interview])
        format.html { redirect_to @routine_interview, notice: 'Followup interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @routine_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routine_interviews/1
  # DELETE /routine_interviews/1.json
  def destroy
    @routine_interview = RoutineInterview.find(params[:id])
    @routine_interview.destroy

    respond_to do |format|
      format.html { redirect_to routine_interviews_url }
      format.json { head :no_content }
    end
  end
end
