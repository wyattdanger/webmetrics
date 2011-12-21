require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/webmetrics'

describe Webmetrics::Request do
  before do
    @w = Webmetrics::Request.new(
      api_key: '83c9bfe31801e45713a96c5c7f7b9a8aa0e04eec',
      method:  'processeddata.getdata',
      username: 'mailchimp'
    )
  end

  describe 'validations' do

    it "is not valid without required options" do
      Webmetrics::Request.new.valid?.must_equal false
    end

    it "is valid with required options" do
      @w.valid?.must_equal true
    end
  end

  describe "query_string" do
    it "returns a string" do
      @w.query_string.class.must_equal String
    end
  end

  describe "create_hash" do
    it "creates a hash and adds it to options" do
      skip "Implement in call()"
    end
  end

  describe "create_signature" do
    it "creates a signature and adds it to options" do
      skip "Implement in call()"
    end
  end

end
