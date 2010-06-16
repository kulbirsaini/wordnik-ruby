require 'helper'

class TestWordnikRuby < Test::Unit::TestCase

  should "raise InvalidApiKeyError if no api key specified in initializer" do
    assert_raises(InvalidApiKeyError) do
      Wordnik.new
    end
  end

  context "a valid api key" do
    setup do
      @api_key = "85b993ddaabe04346e0090d379b02d18ad04bda75d4e0ecca"
    end

    should "instantiate a Wordnik object without authentication" do
      w = Wordnik.new({:api_key=>@api_key})
      assert_equal w.class, Wordnik
      assert_equal w.api_key, @api_key
      assert w.auth_token.nil?
      assert w.user_id.nil?
    end

    context "a valid, unauthenticated Wordnik object" do
      setup do
        @w = Wordnik.new({:api_key=>@api_key})
      end

      should "raise InvalidAuthTokenError for api methods that require authentication, if no valid auth_key" do
        assert_raises(InvalidAuthTokenError){ @w.lists }
        assert_raises(InvalidAuthTokenError){ @w.create_list("testlist", "testdescription") }
      end

      should "" do
      end
    end

  end

end
