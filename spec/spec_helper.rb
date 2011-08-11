$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'kewego_party'
require 'rspec'
require 'webmock/rspec'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/cassette_library'
  c.stub_with :webmock
  c.ignore_localhost = true
  c.default_cassette_options = { :record => :once }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

RSpec.configure do |c|
  c.include WebMock::API

  c.after do
    KewegoParty.reset
  end
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end