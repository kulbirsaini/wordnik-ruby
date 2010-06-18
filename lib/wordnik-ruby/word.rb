class Word
  
  attr_accessor :wordstring, :rel_type
  
  def initialize(options={})
    @id = options['id']
    @wordstring = options['wordstring']
    @rel_type = options['rel_type']
  end

  # this is used for making api calls
  def client
    return Wordnik.client
  end
  
  # find a word, e.g. Word.find('cat')
  # returns a Word object
  # takes two optional arguments, :use_suggest and :literal
  # if options[:use_suggest]=true, it'll return an array of suggestions for your word.  
  # e.g. Word.find('Zeebra', {:use_suggest=>true}) will return {'id':87264, 'suggestions'=>['zebra'], 'wordstring'=>'Zeebra'}
  # if options[:use_suggest]=true and options[:literal]=false, it won't return an array of suggestions -- it'll simply return the most likely candidate 
  # e.g. Word.find('Zeebra', {:use_suggest=>true, :literal=>false}) will return {'id':87264, 'wordstring'=>'Zeebra'}
  def self.find(the_wordstring, options={})
    options[:use_suggest] ||= nil
    options[:not_literal] ||= false
    word_data = Wordnik.get("/word.json/#{URI.escape(the_wordstring)}", {:headers=>Wordnik.client.api_headers, :query=>{:useSuggest=>options[:use_suggest], :literal=>!options[:not_literal]}})
    if (options[:use_suggest].nil? || (options[:use_suggest] && options[:not_literal]))
      return Word.new(word_data)
    else
      return word_data
    end
  end

  # get this word's definitions
  # returns an array of Definition objects
  def definitions
    raw_defs = Wordnik.get("/word.json/#{URI.escape(self.wordstring)}/definitions", {:headers => self.client.api_headers} )
    return raw_defs.map{|definition| Definition.new(definition) }
  end

  # get example sentences for this word
  # returns an array of Example objects
  def examples
    raw_examples = Wordnik.get("/word.json/#{URI.escape(self.wordstring)}/examples", {:headers => self.client.api_headers} )
    return raw_examples.map{|example| Example.new(example) }
  end

  # get this word's related words
  # returns a hash -- keys are relation type (e.g. synonym, antonym, hyponym, etc), values are arrays of Word objects
  def related
    raw_related = Wordnik.get("/word.json/#{URI.escape(self.wordstring)}/related", {:headers => self.client.api_headers})
    related_hash = {}
    raw_related.each{|type|
      related_hash[type['relType']] ||= []
      type['wordstrings'].each{|word|
        related_hash[type['relType']] << Word.new({'wordstring' => word, 'rel_type' => type['relType']})
      }
    }
    return related_hash
  end

  # get phrases that contain this word
  # e.g. Word.find("Christmas").phrases => ["merry Christmas", "Christmas Eve", "Christmas tree", ...]
  def phrases
    word_phrases = Wordnik.get("/word.json/#{URI.escape(self.wordstring)}/phrases", {:headers => self.client.api_headers})
    return word_phrases
  end

  # see how often this word appears before punctuation (period, question mark, exclamation point)
  def punctuation
    punctuation_factor = Wordnik.get("/word.json/#{URI.escape(self.wordstring)}/punctuationFactor", {:headers => self.client.api_headers})
    return punctuation_factor
  end

  # fetches a word’s text pronunciation from the Wordnik corpus, in arpabet and/or gcide-diacritical format
  def text_pronunciation
    text_pron = Wordnik.get("/word.json/#{URI.escape(self.wordstring)}/pronunciations")
    return text_pron
  end

end
