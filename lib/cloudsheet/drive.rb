require "cloudsheet/sheet"

module Cloudsheet
  class Drive < Sheet
    def initialize(hash)
      if hash[:user] and hash[:password]
        drive = GoogleDrive.login(hash[:user], hash[:password])
      elsif hash[:access_token]
        drive = GoogleDrive.login_with_oauth(hash[:access_token])
      else
        raise "Missing Google Credentials"
      end

      if hash[:sheet_key]
        @workbook = drive.spreadsheet_by_key(hash[:sheet_key])
      else
        raise "Missing sheet key"
      end

      if hash[:sheet]
        @raw_sheet = @workbook.worksheets[hash[:sheet]]
      else
        @raw_sheet = @workbook.worksheets[0]
      end
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
