require "cloudsheet/row"
require "cloudsheet/map"
require "cloudsheet/mapping"

module Cloudsheet
  class Sheet
    attr_reader :raw_sheet, :workbook

    def map(m)
      @map = m
      self
    end

    def each
      rows.each do |r|
        yield Row.new.parse(r, @map)
      end
    end

    def rows
      @raw_sheet.rows
    end

    def sheet(num)
      @raw_sheet = @workbook[num]
      self
    end
  end
end
