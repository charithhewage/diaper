class DataExportsController < ApplicationController
  respond_to :html, :csv

  def csv
    type = params[:type]

    respond_to do |format|
      format.html
      format.csv { send_data data(type), filename: "#{type}-#{Time.zone.today}.csv" }
    end
  end

  private

  def data(type)
    DataExport.new(current_organization, type).as_csv
  end
end