require 'csv'

class CsvController < ApplicationController
  def upload
  end

  def update
  	@csv = CSV::Reader.parse params[:csv]
  	flash[:notice] = "got a CSV file!"
  end
end
