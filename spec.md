# Specifications for the Sinatra Assessment
_Provided by [Flatiron School](https://github.com/learn-co-students/sinatra-cms-app-assessment-v-000/blob/master/spec.md)_

Specs:
- [x] Use Sinatra to build the app
_Built using the [Corneal](https://thebrianemory.github.io/corneal/) gem with Sinatra, ActiveRecord, and SQLite3. [Deployed on Heroku](http://notenice.xyz) with PostgreSQL._

- [X] Use ActiveRecord for storing information in a database
_Utilizes ActiveRecord CRUD macros to persist records in a database._

- [X] Include more than one model class (e.g. User, Post, Category)
_Contains a `User` class and a `Notes` class._

- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
_A `User` instance has_many `Note` instances._

- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
_A `Note` instance belongs_to a `User` instance._

- [X] Include user accounts with unique login attribute (username or email)
_User accountsh ave unique usernames, as well as other validations._

- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
_The `Notes` resource has full CRUD abilities. The `User` resouce has create, read, and update abilities available in the view; there is an action in the controller for deleting, as well, but deleting a `User` is not currently available for users._

- [X] Ensure that users can't modify content created by other users
_Since the point of the app is to be collaborative, users have the ability to __Copy__ another user's note, but they cannot directly edit it. It is a planned feature to include a git-like collaborative workflow, where users can push their versions of notes into the head/origin note._

- [X] Include user input validations
_Includes input validations for `User` model, specifically requirements on username uniqueness, password length, and terms of service acceptance._

- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
_Uses `user.errors.messages` to generate `@failure_message` and `@success_message` in the views when appropriate._

- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
_Readme includes links to the Code of Conduct and the Contributors Covenant, as well as information to immediately contribute using Gitpod._

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message