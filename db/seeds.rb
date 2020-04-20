require_relative "../app/models/user.rb"
require_relative "../app/models/note.rb"

# User.create("avi", "Avi F.", "Founder of Flatiron School", "flatiron")
# User.create("liz", "Liz L.", "Coolest coder you know", "hogwarts")
# User.create("megan", "Megan K.", "I have two cats and a dog and sometimes I write stuff", "electra")
# User.create("thomas", "Thomas W.", "First time coder, long time friend... follow me on twitter @beinglogical", "creator")
# User.create("nina", "Nina W.", "Mostly harmless", "newjersey")
User.destroy_all
Note.destroy_all