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
    sections = params[:section].map {|section_name| Section.find_by_name(section_name)}
    @user.sections = sections
    @user.save
    @user.update_attributes(params[:user])
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
    @available_sections = Section.where(:user_id == nil)
    @sections = (@user.sections + @available_sections).uniq!.sort!
  end
end
