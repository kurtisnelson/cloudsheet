require 'coveralls'
Coveralls.wear! 'rails'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'pry'
require 'vcr'
require 'cloudsheet'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

ENV['G_USERNAME'] ||= 'dummy_user'
ENV['G_PASSWORD'] ||= 'dummy_pass'
ENV['G_SPREADSHEET'] ||= 'dummy_sheet'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.filter_sensitive_data('SEKRT_GOOGLE_USER') { ENV['G_USERNAME'] }
  c.filter_sensitive_data('SEKRT_GOOGLE_PASS') { ENV['G_PASSWORD'] }
  c.filter_sensitive_data('SEKRT_GOOGLE_SPREADSHEET') { ENV['G_SPREADSHEET'] }
end

RSpec.configure do |config|

end
