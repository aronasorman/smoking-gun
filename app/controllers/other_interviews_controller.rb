class OtherInterviewsController < ApplicationController
  # GET /other_interviews
  # GET /other_interviews.json
  def index
    @other_interviews = OtherInterview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @other_interviews }
    end
  end

  # GET /other_interviews/1
  # GET /other_interviews/1.json
  def show
    @other_interview = OtherInterview.find(params[:id])
    @student = @other_interview.interview.student
    @student_name = [@student.first_name, @student.last_name].join ' '

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @other_interview }
    end
  end

  # GET /other_interviews/new
  # GET /other_interviews/new.json
  def new
    @interview = Interview.new
    @other_interview = OtherInterview.new
    schedule_entry = ScheduleEntry.find_by_id(params[:schedule_entry_id])
    @interview.student_id = schedule_entry.student_id
    @interview.period_id = schedule_entry.period_id
    @interview.user_id = schedule_entry.user_id
    @interview.interview_type_id = schedule_entry.interview_type_id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @other_interview }
    end
  end

  # GET /other_interviews/1/edit
  def edit
    @other_interview = OtherInterview.find(params[:id])
    @interview = Interview.find_by_id(@other_interview.interview_id)
  end

  # POST /other_interviews
  # POST /other_interviews.json
  def create
    @interview = Interview.new(params[:interview])
    @other_interview = OtherInterview.new(params[:other_interview])
    @other_interview.interview = @interview

    respond_to do |format|
      if @other_interview.save
        format.html { redirect_to @other_interview, notice: 'Followup interview was successfully created.' }
        format.json { render json: @other_interview, status: :created, location: @other_interview }
      else
        format.html { render action: "new" }
        format.json { render json: @other_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /other_interviews/1
  # PUT /other_interviews/1.json
  def update
    @other_interview = OtherInterview.find(params[:id])
    @interview = Interview.find(@other_interview.interview_id)

    respond_to do |format|
      if @other_interview.update_attributes(params[:other_interview]) && @interview.update_attributes(params[:interview])
        format.html { redirect_to @other_interview, notice: 'Followup interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @other_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_interviews/1
  # DELETE /other_interviews/1.json
  def destroy
    @other_interview = OtherInterview.find(params[:id])
    @other_interview.destroy

    respond_to do |format|
      format.html { redirect_to routine_interviews_url }
      format.json { head :no_content }
    end
  end
end
