require 'helper'

class TestWordnikRuby < Test::Unit::TestCase

  should "raise InvalidApiKeyError if no api key specified in initializer" do
    assert_raise(InvalidApiKeyError) do
      Wordnik.new
    end
  end

  context "a valid api key" do
    setup do
      @api_key = "test_api_key"
    end

    should "instantiate a Wordnik object without authentication" do
      w = Wordnik.new({:api_key=>@api_key})
      assert_equal w.class, Wordnik
      assert_equal w.api_key, @api_key
      assert w.auth_token.nil?
      assert w.user_id.nil?
      assert !w.authenticated?
    end

    context "a valid, unauthenticated Wordnik client" do
      setup do
        @w = Wordnik.new({:api_key=>@api_key})
      end

      should "raise InvalidAuthTokenError for api methods that require authentication, if no valid auth_key" do
        assert_raise(InvalidAuthTokenError){ @w.lists }
        assert_raise(InvalidAuthTokenError){ @w.create_list("testlist", "testdescription") }
      end

      should "get api headers" do
        assert_equal @w.api_headers, {'Content-Type'=>'application/json', 'api_key' => @api_key}
      end

      should 'find a word' do
        stub_get('/word.json/cat', 'word_find.json')
        word = Word.find('cat')
        assert word.is_a?(Word)
        assert_equal word.wordstring, 'cat'
      end

      context "a valid word" do
        setup do
          stub_get('/word.json/cat', 'word_find.json')
          @word = Word.find('cat')
        end

        should 'get definitions for a word' do
          stub_get('/word.json/cat/definitions', 'word_definitions.json')
          definitions = @word.definitions
          assert_equal definitions.length, 11
          d0 = definitions[0]
          assert d0.is_a?(Definition)
          assert_equal d0.headword, 'cat'
          assert_equal d0.part_of_speech, 'noun'
          assert_equal d0.text, "Any animal belonging to the natural family Felidae, and in particular to the various species of the genera Felis, Panthera, and Lynx. The domestic cat is Felis domestica. The European wild cat (Felis catus) is much larger than the domestic cat. In the United States the name wild cat is commonly applied to the bay lynx (Lynx rufus). The larger felines, such as the lion, tiger, leopard, and cougar, are often referred to as cats, and sometimes as big cats. See wild cat, and tiger cat."
        end

        should 'get examples for a word' do
          stub_get('/word.json/cat/examples', 'word_examples.json')
          examples = @word.examples
          assert_equal examples.length, 5
          e0 = examples[0]
          assert e0.is_a?(Example)
          assert_equal e0.year, 1992
          assert_equal e0.title, "Timegod's World"
          assert_equal e0.display, "That mountain cat is a very confused young hunter, and he might not attack you the next time, and you might be able to dive out of the way again."
        end

        should 'get related words for a word' do
          stub_get('/word.json/cat/related', 'word_related.json')
          related = @word.related
          assert_equal related.keys.sort, ["cross-reference", "equivalent", "form", "hyponym", "same-context", "synonym", "variant", "verb-form"]
          related.each do |k,v| 
            assert v.is_a?(Array)
            v.each do |rel_word|
              assert rel_word.is_a?(Word)
              assert_equal rel_word.rel_type, k
            end
          end
        end
      end

    end

    context "a valid, authenticated Wordnik client" do
      setup do
        @w = Wordnik.new({:api_key=>@api_key, :username=>"", :password=>""})
      end
    end

  end

end
