require 'minitest/spec'
require 'minitest/autorun'
require 'yaml'
require_relative 'spec_helper'
require_relative '../lib/webmetrics'

# place your credentials in a yaml file in spec for testing
test_credentials = YAML.load_file File.join(
  File.dirname(__FILE__), 'credentials.yml')

describe Webmetrics::API do
  before do
    @w = Webmetrics::API.new(
      api_key: test_credentials['api_key'],
      username: test_credentials['username']
    )
  end

  describe "get" do
    it "makes an http request" do
      @w.request :method => 'maintenance.getServices' do |res, io|
        puts res
        puts io.content_type
      end
    end

  end

end
