module Wordnik
  class Provider

    attr_accessor :id, :name

    def initialize( options = {} )
      @id = options['id']
      @name = options['name']
    end

  end
end
