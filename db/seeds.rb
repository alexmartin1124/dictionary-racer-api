# nouns = File.read("nounlist.txt").split("\n")
# nouns.each {|noun| EntryCreator.new(noun).create_entry}


alex = User.create(username: "alex", email: "alex@dictionaryracer.com", password: "password", password_confirmation: "password")
jj = User.create(username: "jj", email: "jj@dictionaryracer.com", password: "password", password_confirmation: "password")

puzzle1 = Puzzle.create(start_word: "bathrobe", end_word: "action", best_path: ["bathrobe", "coat", "surface", "land", "action"], difficulty: "easy")
puzzle2 = Puzzle.create(start_word: "weed", end_word: "skill", best_path: ["weed", "garden", "land", "ground", "skill"], difficulty: "easy")

puzzle1.best_path.each do |w|
  e = Entry.find_by(word: w)
  e = EntryCreator.new(e).create_entry unless e
  puzzle1.entries << e
end

puzzle2.best_path.each do |w|
  e = Entry.find_by(word: w)
  e = EntryCreator.new(e).create_entry unless e
  puzzle1.entries << e
end

alex.puzzles << puzzle1
jj.puzzles << puzzle2
