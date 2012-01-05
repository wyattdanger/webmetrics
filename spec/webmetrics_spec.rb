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
      @wm.request :method => 'maintenance.getServices' do |res|
        res.must_be_instance_of Hash
      end
    end
  end

=begin
  describe "processeddata.getdata" do
    it "returns processed data" do
      @wm.request({
        :method => 'processeddata.getdata',
        :sday => 1,
        :smonth => 1,
        :syear => 2012,
        :eday => Time.now.day,
        :emonth => Time.now.month,
        :eyear => Time.now.year,
        :serviceid => test_credentials['serviceid']
      }) do |res|
        res.must_be_instance_of Hash
      end
    end
  end
=end

end
