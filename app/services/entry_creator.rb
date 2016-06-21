require 'open-uri'

class EntryCreator

  def self.create_entry(word)
    client = MWDictionaryAPI::Client.new(ENV['DICTIONARY_API_KEY'], api_type: 'collegiate')
    result = client.search(word)
    unless result.entries.empty?
      definition = result.entries.first[:definitions].first[:text]
      Entry.create(word: word, definition: definition)
    else
      nil
    end
  end

end
