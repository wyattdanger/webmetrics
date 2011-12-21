require 'test/unit'
require_relative '../lib/webmetrics'

class MyUnitTests < Test::Unit::TestCase

  def setup
    @w = Webmetrics::API.new
  end

  def teardown
    ## Nothing
  end

  def test_existence
    assert_not_nil @w
  end

end
