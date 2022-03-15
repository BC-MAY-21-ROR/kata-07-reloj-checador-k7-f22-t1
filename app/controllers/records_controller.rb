class RecordsController < ApplicationController
  def index
    @records = Records.all
  end
  def new
    @record = Record.new
  end
end
