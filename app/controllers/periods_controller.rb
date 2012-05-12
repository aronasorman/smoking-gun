class PeriodsController < ApplicationController
  before_filter :authenticate_user!
  # GET /periods
  # GET /periods.json
  def index
    current_date = Date.today
    monday = current_date.monday
    dates_this_week = [monday, monday.next, monday.next.next, monday.next.next.next, monday.next.next.next.next]
    @grouped_periods = Period.where(:date => dates_this_week).group_by {|period| period.num}.values
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
    @period = Period.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @period }
    end
  end

  # GET /periods/new
  # GET /periods/new.json
  def new
    @period = Period.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @period }
    end
  end

  # GET /periods/1/edit
  def edit
    @period = Period.find(params[:id])
  end

  # POST /periods
  # POST /periods.json
  def create
    @period = Period.new(params[:period])

    respond_to do |format|
      if @period.save
        format.html { redirect_to @period, notice: 'Period was successfully created.' }
        format.json { render json: @period, status: :created, location: @period }
      else
        format.html { render action: "new" }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /periods/1
  # PUT /periods/1.json
  def update
    @period = Period.find(params[:id])

    respond_to do |format|
      if @period.update_attributes(params[:period])
        format.html { redirect_to @period, notice: 'Period was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @period = Period.find(params[:id])
    @period.destroy

    respond_to do |format|
      format.html { redirect_to periods_url }
      format.json { head :no_content }
    end
  end
end
