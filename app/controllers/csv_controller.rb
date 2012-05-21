require 'csv'
class CsvController < ApplicationController
  def upload
  end

  def update
  	flash[:notice] = "got a CSV file!"
  	Thread.new(params[:csv]) {|csv| Student.import(csv) }
  end
end
