require_relative "../app/models/user.rb"
require_relative "../app/models/note.rb"

users = [
	[ "avi", "Avi F.", "Founder of Flatiron School", "flatiron" ],
	[ "liz", "Liz L.", "Coolest coder you know", "hogwarts" ],
	[ "megan", "Megan K.", "I have two cats and a dog and sometimes I write stuff", "electra" ],
	[ "thomas", "Thomas W.", "First time coder, long time friend... follow me on twitter @beinglogical", "creator" ]
	[ "nina", "Nina W.", "Mostly harmless", "newjersey" ]
 ]
 
 users.each do |username, name, profile, password|
	User.create( username: username, name: name, profile: profile, password: password )
 end

=begin

 end
 notes.each do |topic, content, user_id|
	Note.create( topic: topic, content: content, user_id: user_id )
 end
 =end