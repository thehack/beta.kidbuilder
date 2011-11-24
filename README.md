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

	git pull
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

##Change I will make to URLS:
I haven't liked the non-dryness and complexity of how I was planning to solve offering custom urls and custom layout for kidbuilder. 
I will get rid of the splat url placeholder for the groups name and have the group looked up by user.group.
Their custom url will point to the site root. If it finds they are logged in, it will log them in, otherwise take them to '/groups/groupname/welcomepage'.

##Lessons
Lessons urls: '/lessons/1/page/1'
and they would tie-in with whatever resource they needed to pull up. those resources would also be available by their names
a featured lesson
a featured game
a featured player (maybe?)

linkable menu structure above game container like itunes

lesson 1 > page 1
or
tilegame 1

and an index showing which lessons have been completed.

##Brain-storming belts/lessons:
###God =  ♥.
###God, the Great Inventor.
He created everything.
We belong to Him and He makes the rules!
###Prayer: You can Talk to God about Anything.
It's not a formula or a spell. God wants to hear about our lives.
He wants us to trust that He can make a difference.
###Born for Glory: God's Glory
###Jesus has made God's Forgiveness Available to Everyone. // 
Although selfish, sinful choices naturally build a wall between us and God, Jesus' personal sacrifice has made forgiveness 
###God's Spirit can help You Live for Him.
###Identity and purpose
