# ![NoteNice - because sharing is caring](https://raw.githubusercontent.com/twwright/notenice/master/public/images/NoteNice.png)

## __NoteNice__ is a web app for Flatiron School written in Ruby using Sinatra with ActiveRecord and SQLite.
NoteNice is a collaborative note-taking app for sharing and editing notes with your friends. Future features will include more robust git-like version control to keep everyone on the same page!

## Running NoteNice

### Using the web
This app has been deployed for immediate use into Heroku, available at www.notenice.xyz. Deployment environments and groups have been configured using PostgreSQL in this repo, although SQLite3 is still being used for development.

### Using a localhost

#### Prerequisites
Shotgun requires Linux, Mac OSX or Linux VM on Windows.
Other than the gems listed in this app's Gemfile, you will need to have Ruby installed on your local machine as well as the ability to install Ruby gems.


#### Built With
- Sinatra
- ActiveRecord
- Corneal
- SQLite3 (development)
- PostgreSQL (deployment)

#### Setting up for development
If you are interested in jumping into the code by the fastest route psosible, the simplest way to access the code for development is to use [![this Gitpod.io link](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/twwright/notenice) 

If you want to work on your local environment, you can start by forking and cloning this GitHub repo to your local machine, using the terminal. 

``` 
git@github.com:twwright/notenice.git
```
Change directories into the repo directory and run the $bundle install command. 

``` 
cd notenice
bundle install
```

Run the $shotgun command to start an automatic reload version of rackup.

```
shotgun
```
You can then navigate to the route displayed in the terminal. (E.g. http://127.0.0.1:9393)

After making any changes to the code, reload your browser window to make a new request and see your changes. 
Navigate to the routes in `notes_controller`, `application_controller`, and `user_controller` to create, read, and edit new `User` objects as well as create, read, update and destroy `Note` objects.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/twwright/notenice. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/twwright/notenice/code_of_conduct.md) code of conduct.

Looking for a specific way to contribute? 
Check out the `Issues` section with TODOs, bugs to fix, and planned features.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

