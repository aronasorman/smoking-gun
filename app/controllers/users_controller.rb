class UsersController < ApplicationController
	before_filter :authenticate_user!
	
  def index
  	@counselors = User.all.find_all { |user| user.role == 'Counselor' || user.role == 'Head Counselor' }
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    unless params[:section].nil?
      sections = params[:section].map {|section_name| Section.find_by_name(section_name)}
      @user.sections = sections
      @user.save
    end
    unless params[:user].nil?
      @user.update_attributes(params[:user])
    end
    flash[:notice] = "Section list updated"
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def sectionedit
    @user = User.find(params[:id])
    @available_sections = Section.where(:user_id == nil)
    @sections = (@user.sections + @available_sections).uniq!.sort!
    @sections_partitioned_by_year = (1..4).map do |year|
      @sections.partition {|section| section.name.first == year.to_s}.first
    end
  end
end
