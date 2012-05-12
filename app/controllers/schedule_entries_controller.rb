class ScheduleEntriesController < ApplicationController
  before_filter :authenticate_user!
  # GET /schedule_entries
  # GET /schedule_entries.json
  def index
    @schedule_entries = ScheduleEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_entries }
    end
  end

  # GET /schedule_entries/1
  # GET /schedule_entries/1.json
  def show
    @schedule_entry = ScheduleEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_entry }
    end
  end

  # GET /schedule_entries/new
  # GET /schedule_entries/new.json
  def new
    @schedule_entry = ScheduleEntry.new
    handled_sections_id = current_user.sections.map {|section| section.id}
    @students = Student.where(:section_id => handled_sections_id).page(params[:page])
    @interview_types = InterviewType.all
    @period = Period.find(params[:period_id])
  end

  # GET /schedule_entries/1/edit
  def edit
    @schedule_entry = ScheduleEntry.find(params[:id])
  end

  # POST /schedule_entries
  # POST /schedule_entries.json
  def create
    @schedule_entry = ScheduleEntry.new(params[:schedule_entry])

    respond_to do |format|
      if @schedule_entry.save
        format.html { redirect_to @schedule_entry, notice: 'Schedule entry was successfully created.' }
        format.json { render json: @schedule_entry, status: :created, location: @schedule_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_entries/1
  # PUT /schedule_entries/1.json
  def update
    @schedule_entry = ScheduleEntry.find(params[:id])

    respond_to do |format|
      if @schedule_entry.update_attributes(params[:schedule_entry])
        format.html { redirect_to @schedule_entry, notice: 'Schedule entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_entries/1
  # DELETE /schedule_entries/1.json
  def destroy
    @schedule_entry = ScheduleEntry.find(params[:id])
    @schedule_entry.destroy

    respond_to do |format|
      format.html { redirect_to schedule_entries_url }
      format.json { head :no_content }
    end
  end
end
