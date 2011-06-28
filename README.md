##Shortcuts
I made a little script to generate a controller and associated views:
./script/generate.rb modelname # generates a basic crud controller

Here's a one-liner to remove deleted files from the git repo:
git ls-files -d -z | xargs -0 git update-index --remove

Self-reminder: If I want this to be compatible with the old passwords, I need to update password encryption to match.

##Git Workflow:
on my local machine:

git add .
git commit -m "message"
git push origin master

ssh into Dreamhost.

##Setup
It needs (locally and on the server) a database_config.rb file that gets ignored by .gitignore with the following:
	DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/kidbuilder.sqlite3") #locally, or:

	DataMapper.setup(:default, {
    :adapter  => 'mysql',
    :host     => 'mysql.******.***',
    :username => '*********',
    :password => '*********',
    :database => '*******'})

	cd into directory
	git pull

##TO ACCESS CONSOLE:
	irb -r main-app.rb


