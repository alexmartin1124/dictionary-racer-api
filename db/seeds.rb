nouns = File.read("nounlist.txt").split("\n")
nouns.each {|noun| EntryCreator.new(noun).create_entry}


alex = User.create(username: "alex", email: "alex@dictionaryracer.com", password: "password", password_confirmation: "password")
jj = User.create(username: "jj", email: "jj@dictionaryracer.com", password: "password", password_confirmation: "password")
