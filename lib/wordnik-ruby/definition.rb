module Wordnik
  class Definition

    attr_accessor :id, :headword, :text, :extended_text, :part_of_speech, :related_words

    def initialize(options={})
      @id = options["id"]
      @headword = options["headword"]
      @text = options["text"]
      @extended_text = options["extendedText"]
      @part_of_speech = options["partOfSpeech"]
      @related_words = options["relatedWords"].map{ |related_word| RelatedWord.new(related_word) } unless options["relatedWords"].nil? or options["relatedWords"].empty?
    end

  end
end
