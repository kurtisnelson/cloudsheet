require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "google_drive"

describe Cloudsheet::Drive do
  before :all do
    @google_spreadsheet = GoogleDrive.login(ENV['G_USERNAME'], ENV['G_PASSWORD']).spreadsheet_by_key(ENV['G_SPREADSHEET'])
  end
  
  subject{Cloudsheet::Drive.new(user: ENV['G_USERNAME'], password: ENV['G_PASSWORD'], sheet_key: ENV['G_SPREADSHEET'])}
  
  it "initializes" do
    subject.raw_sheet.worksheet_feed_url.should eq(@google_spreadsheet.worksheets[0].worksheet_feed_url)
  end

  it "selects a worksheet" do
    subject.sheet(0).raw_sheet.worksheet_feed_url.should eq(@google_spreadsheet.worksheets[0].worksheet_feed_url)
  end

  describe "rows" do
    it "eliminates the header" do
      subject.rows.count.should eq(34)
    end

    it "is enumerated without a map" do
      i = 2
      ws = @google_spreadsheet.worksheets[0]
      subject.each do |r|
        r[0].should eq(ws[i, 1])
        i += 1
      end
    end

    it "enumerates with a map" do
      m = Cloudsheet::Map.new
      m[0] = Cloudsheet::Mapping.new(:name)
      m[1] = Cloudsheet::Mapping.new(:start_date).map(->(d) {DateTime.strptime(d, "%m/%d/%Y")})
      subject.map(m)

      ws = @google_spreadsheet.worksheets[0]
      i = 2
      subject.each do |r|
        r[:name].should eq(ws[i, 1])
        r[:start_date].should eq(DateTime.strptime(ws[i, 2], "%m/%d/%Y"))
        r[2].should eq(ws[i, 3])
        i += 1
      end
    end
  end
end
