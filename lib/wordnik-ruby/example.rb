module Wordnik
  class Example

    attr_accessor :id, :display, :rating, :url, :title, :year, :document_id, :provider

    def initialize(options={})
      @id = options['exampleId']
      @display = options['display']
      @rating = options['rating']
      @url = options['url']
      @title = options['title']
      @year = options['year']
      @document_id = options['documentId']
      @provider = Provider.new(options['provider'])
    end

  end
end
