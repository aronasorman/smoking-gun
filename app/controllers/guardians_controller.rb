class GuardiansController < ApplicationController
  # GET /guardians
  # GET /guardians.json
  def index
    @guardians = Guardian.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guardians }
    end
  end

  # GET /guardians/1
  # GET /guardians/1.json
  def show
    @guardian = Guardian.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guardian }
    end
  end

  # GET /guardians/new
  # GET /guardians/new.json
  def new
    @guardian = Guardian.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guardian }
    end
  end

  # GET /guardians/1/edit
  def edit
    @guardian = Guardian.find(params[:id])
  end

  # POST /guardians
  # POST /guardians.json
  def create
    @guardian = Guardian.new(params[:guardian])

    respond_to do |format|
      if @guardian.save
        format.html { redirect_to @guardian, notice: 'Guardian was successfully created.' }
        format.json { render json: @guardian, status: :created, location: @guardian }
      else
        format.html { render action: "new" }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guardians/1
  # PUT /guardians/1.json
  def update
    @guardian = Guardian.find(params[:id])

    respond_to do |format|
      if @guardian.update_attributes(params[:guardian])
        format.html { redirect_to @guardian, notice: 'Guardian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guardians/1
  # DELETE /guardians/1.json
  def destroy
    @guardian = Guardian.find(params[:id])
    @guardian.destroy

    respond_to do |format|
      format.html { redirect_to guardians_url }
      format.json { head :no_content }
    end
  end
end
