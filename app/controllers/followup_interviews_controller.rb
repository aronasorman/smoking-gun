class FollowupInterviewsController < ApplicationController
  # GET /followup_interviews
  # GET /followup_interviews.json
  def index
    @followup_interviews = FollowupInterview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @followup_interviews }
    end
  end

  # GET /followup_interviews/1
  # GET /followup_interviews/1.json
  def show
    @followup_interview = FollowupInterview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @followup_interview }
    end
  end

  # GET /followup_interviews/new
  # GET /followup_interviews/new.json
  def new
    @followup_interview = FollowupInterview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @followup_interview }
    end
  end

  # GET /followup_interviews/1/edit
  def edit
    @followup_interview = FollowupInterview.find(params[:id])
  end

  # POST /followup_interviews
  # POST /followup_interviews.json
  def create
    @followup_interview = FollowupInterview.new(params[:followup_interview])

    respond_to do |format|
      if @followup_interview.save
        format.html { redirect_to @followup_interview, notice: 'Followup interview was successfully created.' }
        format.json { render json: @followup_interview, status: :created, location: @followup_interview }
      else
        format.html { render action: "new" }
        format.json { render json: @followup_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /followup_interviews/1
  # PUT /followup_interviews/1.json
  def update
    @followup_interview = FollowupInterview.find(params[:id])

    respond_to do |format|
      if @followup_interview.update_attributes(params[:followup_interview])
        format.html { redirect_to @followup_interview, notice: 'Followup interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @followup_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followup_interviews/1
  # DELETE /followup_interviews/1.json
  def destroy
    @followup_interview = FollowupInterview.find(params[:id])
    @followup_interview.destroy

    respond_to do |format|
      format.html { redirect_to followup_interviews_url }
      format.json { head :no_content }
    end
  end
end
