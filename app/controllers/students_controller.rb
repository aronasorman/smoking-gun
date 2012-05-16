class StudentsController < ApplicationController
  before_filter :authenticate_user!
  # GET /students
  # GET /students.json
  def index
    sections_handled = current_user.sections.map! {|section| section.id }
    @students = Student.where( :section_id => sections_handled).page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    sections_handled = current_user.sections.map {|sec| sec.id}
    if Student.where(:section_id => sections_handled).member? @student
      @name = [@student.first_name, @student.last_name].join ' '

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @student }
      end
    else
      redirect_to students_path
      flash[:notice] = "You cannot view that student"
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    if Student.where(:section_id => sections_handled).member? @student
      @name = [@student.first_name, @student.last_name].join ' '
    else
      redirect_to students_path
      flash[:notice] = "You cannot edit that student"
    end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
