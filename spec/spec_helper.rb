$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'bundler/setup'

require 'tassadar'
require 'vcr'
REPLAY_DIR = File.join(File.dirname(__FILE__), 'replays')

VCR.configure do |c|
  c.cassette_library_dir = File.join(File.dirname(__FILE__), 'vcr')
  c.hook_into :fakeweb
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.mock_with :rr

  config.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
    options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    VCR.use_cassette(name, options) {example.call}
  end
end

