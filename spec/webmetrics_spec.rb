require 'minitest/spec'
require 'minitest/autorun'
require 'yaml'
require_relative 'spec_helper'
require_relative '../lib/webmetrics'

# place your credentials in a yaml file in spec for testing
test_credentials = YAML.load_file(File.join(File.dirname(__FILE__), 'credentials.yml'))

describe Webmetrics::API do
  before do
    @wm = Webmetrics::API.new(
      api_key: test_credentials['api_key'],
      username: test_credentials['username']
    )
  end

  describe "get" do
    it "yields a Hash and a StringIO" do
      @wm.request :method => 'maintenance.getServices' do |res, io|
        res.must_be_instance_of Hash
        io.must_be_instance_of  StringIO
      end
    end
  end
end
