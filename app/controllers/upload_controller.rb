require 'spreadsheet'

class UploadController < ApplicationController
  def index
    render :action => :new
  end

  def new
  end

  def show
  end

  def upload
    spreadsheet_file_path = copy_to_disk(params[:spreadsheet_file])
    parse_spreadsheet(spreadsheet_file_path)
    copy_to_disk(params[:trace_file])
    copy_to_disk(params[:image_file])
    redirect_to :controller => :upload, :action => :show
  end

  def parse_spreadsheet(file_path)
    if file_path.nil?
      return
    end
    book = Spreadsheet.open(file_path)
    voucher_info     = book.worksheet 0
    taxonomy         = book.worksheet 1
    specimen_details = book.worksheet 2
    collection_data  = book.worksheet 3
#    :adult, :code, :collection_date, :collection_site, :picture, :sex, :weight, :species_attributes
    attrs = Hash.new
    start_row = 3
    rows = count_rows(collection_data, start_row)
    places = Array.new
    rows.times do |i|
      row = i + start_row - 1
      attrs[:code] = voucher_info.row(row)[0]
      places[0] = collection_data.row(row)[6]
      places[1] = collection_data.row(row)[5]
      places[2] = collection_data.row(row)[4]
      places[3] = collection_data.row(row)[3]
      attrs[:collection_site] = places.reject(&:nil?).join(', ') # ignore blank entries
    end
    puts attrs
  end

  # start counting from the start row
  # keep counting until the first column of a row is blank
  def count_rows(sheet, start_row)
    rows = 0
    sheet.each (start_row - 1) do |row|
      if row[0].nil? or row[0].empty?
        return rows
      else
        rows = rows + 1
      end
    end
    return rows
  end

  def copy_to_disk(file_io)
    unless file_io.nil?
      file_path = Rails.root.join('public', 'uploads', file_io.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(file_io.read)
      end
      return file_path
    end
  end
end