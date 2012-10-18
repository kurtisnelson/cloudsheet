require "row"
require "mapping"

module Cloudsheet
  class Drive
    attr_reader :sheet, :spreadsheet
    def initialize(drive_session, spreadsheet)
      @spreadsheet = drive_session.spreadsheet_by_key(spreadsheet)
      @sheet = @spreadsheet.worksheets[0]
    end

    def worksheet(num)
      @sheet = @spreadsheet.worksheets[num]
      self
    end

    def map(m)
      @map = m
      self
    end

    def each
      rower = Cloudsheet::Row.new(@map)
      rows.each do |r|
        yield rower.parse(r)
      end
    end

    def rows
      @sheet.rows.drop(1)
    end
  end
end
