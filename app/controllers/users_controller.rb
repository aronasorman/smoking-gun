class UsersController < ApplicationController
	before_filter :authenticate_user!
	
  def index
  	@counselors = User.all.find_all { |user| user.role == 'Counselor' || user.role == 'Head Counselor' }
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
  end
end
