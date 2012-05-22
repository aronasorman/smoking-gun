require 'csv'
class CsvController < ApplicationController
  def upload
  end

  def update
  	flash[:notice] = "got a CSV file!"
  	Thread.new(params[:csv]) do |csv|
  		Student.transaction do
  			Student.archive_all
	  		Student.import(csv)
  		end
  	end
  end
end
