class EntryCreator

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def create_entry
    null = nil
    definitions = call_dictionary
    if definitions["results"]
      definition = definitions["results"].find {|definition| definition["part_of_speech"] == "noun" && definition["senses"] && definition["senses"][0]["definition"]}
      if definition
        Entry.create!(word: word, definition: definition['senses'][0]['definition'][0])
        puts "#{word} got created" 
      else
        puts "#{word} didn't get created" 
      end
    else
      definition = definitions[:results].find {|definition| definition[:part_of_speech] == "noun" && definition[:senses][0][:definition]}
      if definition
        Entry.create!(word: word, definition: definition[:senses][0][:definition][0])
        puts "#{word} got created" 
      else
        puts "#{word} didn't get created" 
      end
    end
  end

private

  def call_dictionary
    JSON.parse(RestClient.get("https://api.pearson.com/v2/dictionaries/ldoce5/entries?headword=#{word}&apikey=#{ENV['DICTIONARY_API_KEY']}"))
  end

end