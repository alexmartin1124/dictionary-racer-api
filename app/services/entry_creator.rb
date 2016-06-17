class EntryCreator

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def create_entry
    null = nil
    definitions = call_dictionary
    if definitions["results"]
      definition = definitions["results"].find {|definition| definition["part_of_speech"] && definition["senses"] && definition["senses"][0]["definition"]}
      Entry.create!(word: word, definition: definition['senses'][0]['definition'][0]) if definition
    else
      definition = definitions[:results].find {|definition| definition[:part_of_speech] && definition[:senses][0][:definition]}
      Entry.create!(word: word, definition: definition[:senses][0][:definition][0]) if definition
    end
  end

private

  def call_dictionary
    JSON.parse(RestClient.get("https://api.pearson.com/v2/dictionaries/ldoce5/entries?headword=#{word}&apikey=#{ENV['DICTIONARY_API_KEY']}"))
  end

end
