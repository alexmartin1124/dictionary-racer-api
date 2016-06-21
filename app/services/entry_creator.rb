require 'open-uri'

class EntryCreator

  def self.create_entry(word)
    client = MWDictionaryAPI::Client.new(ENV['DICTIONARY_API_KEY'], api_type: 'collegiate')
    result = client.search(word)
    unless result.entries.empty?
      definition = gsub_exceptions(result.entries.first[:definitions].first[:text])
      Entry.create(word: word, definition: definition)
    else
      nil
    end
  end

  def self.gsub_exceptions(definition)
    definition.gsub('  ,', ',').gsub(' ,', ',').gsub(': as', '').gsub(/^sed /, 'said ')
  end

end
