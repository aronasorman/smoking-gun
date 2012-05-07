class NatureOfProblemTypesController < ApplicationController
  # GET /nature_of_problem_types
  # GET /nature_of_problem_types.json
  def index
    @nature_of_problem_types = NatureOfProblemType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nature_of_problem_types }
    end
  end

  # GET /nature_of_problem_types/1
  # GET /nature_of_problem_types/1.json
  def show
    @nature_of_problem_type = NatureOfProblemType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nature_of_problem_type }
    end
  end

  # GET /nature_of_problem_types/new
  # GET /nature_of_problem_types/new.json
  def new
    @nature_of_problem_type = NatureOfProblemType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nature_of_problem_type }
    end
  end

  # GET /nature_of_problem_types/1/edit
  def edit
    @nature_of_problem_type = NatureOfProblemType.find(params[:id])
  end

  # POST /nature_of_problem_types
  # POST /nature_of_problem_types.json
  def create
    @nature_of_problem_type = NatureOfProblemType.new(params[:nature_of_problem_type])

    respond_to do |format|
      if @nature_of_problem_type.save
        format.html { redirect_to @nature_of_problem_type, notice: 'Nature of problem type was successfully created.' }
        format.json { render json: @nature_of_problem_type, status: :created, location: @nature_of_problem_type }
      else
        format.html { render action: "new" }
        format.json { render json: @nature_of_problem_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nature_of_problem_types/1
  # PUT /nature_of_problem_types/1.json
  def update
    @nature_of_problem_type = NatureOfProblemType.find(params[:id])

    respond_to do |format|
      if @nature_of_problem_type.update_attributes(params[:nature_of_problem_type])
        format.html { redirect_to @nature_of_problem_type, notice: 'Nature of problem type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nature_of_problem_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nature_of_problem_types/1
  # DELETE /nature_of_problem_types/1.json
  def destroy
    @nature_of_problem_type = NatureOfProblemType.find(params[:id])
    @nature_of_problem_type.destroy

    respond_to do |format|
      format.html { redirect_to nature_of_problem_types_url }
      format.json { head :no_content }
    end
  end
end
