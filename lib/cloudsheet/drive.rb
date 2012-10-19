require "cloudsheet/sheet"

module Cloudsheet
  class Drive < Sheet
    def initialize(drive, spreadsheet)
      @workbook = drive.spreadsheet_by_key(spreadsheet)
      @raw_sheet = @workbook.worksheets[0]
    end

    def sheet(num)
      @raw_sheet = @workbook.worksheets[num]
      self
    end

    def rows
      super.drop(1)
    end
  end
end
