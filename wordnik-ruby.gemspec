# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wordnik-ruby}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Altay Guvench"]
  s.date = %q{2010-08-18}
  s.description = %q{The official gem for the wordnik.com API}
  s.email = %q{aguvench@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/wordnik-ruby.rb",
     "lib/wordnik-ruby/definition.rb",
     "lib/wordnik-ruby/example.rb",
     "lib/wordnik-ruby/list.rb",
     "lib/wordnik-ruby/provider.rb",
     "lib/wordnik-ruby/related_word.rb",
     "lib/wordnik-ruby/word.rb",
     "test/fixtures/user_token.json",
     "test/fixtures/word_autocomplete.json",
     "test/fixtures/word_definitions.json",
     "test/fixtures/word_examples.json",
     "test/fixtures/word_find.json",
     "test/fixtures/word_frequency.json",
     "test/fixtures/word_phrases.json",
     "test/fixtures/word_punctuation.json",
     "test/fixtures/word_random.json",
     "test/fixtures/word_related.json",
     "test/fixtures/word_text_pron.json",
     "test/fixtures/wordlist_words.json",
     "test/fixtures/wordlists.json",
     "test/fixtures/wotd.json",
     "test/helper.rb",
     "test/test_wordnik-ruby.rb",
     "wordnik-ruby.gemspec"
  ]
  s.homepage = %q{http://github.com/wordnik/wordnik-ruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The official gem for the wordnik.com API}
  s.test_files = [
    "test/test_wordnik-ruby.rb",
     "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end

