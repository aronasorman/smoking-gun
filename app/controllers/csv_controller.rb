require 'csv'
class CsvController < ApplicationController
  def upload
  end

  def update
  	flash[:notice] = "got a CSV file!"
  	Student.import(params[:csv])
  end
end
