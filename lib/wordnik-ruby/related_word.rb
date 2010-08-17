module Wordnik
  class RelatedWord

    attr_accessor :gram, :rel_type, :wordstrings

    def initialize( options = {} )
      @gram = options['gram']
      @rel_type = options['relType']
      @wordstrings = options['wordstrings']
    end

  end
end
