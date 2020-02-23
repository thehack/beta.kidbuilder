## Ideas to Implement

#### New game idea
A verticle platformer like DK but starting at the top going down ladders, collect words and time bonuses in chest. timed game. must guess verse before time out. if you die you just start back at the top.

#### Bundler

## Requires
Ruby 2.1.5 with up-to-date gems
imagemagick => on os x 'brew install imagemagick'

## Bootstrap
I have configured it not to be responsive for >1200px screen width. I don't like it that wide and it messes up my stage which is necessarily a fixed width.

## Less
lessc .less/bootstrap.less --compile public/css/bootstrap.css

## Git Workflow:
on my local machine:
    git pull

make edits. test.

    git commit -a -m "message"
    git push origin master

ssh into server.
    
    git pull

Here's a one-liner to remove deleted files from the git repo:
    
    git ls-files -d -z | xargs -0 git update-index --remove

## Setup
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

## TO ACCESS CONSOLE:
	irb -r main-app.rb

## Thin Server
  screen rvmsudo thin -p80 start
  Ctrl+a, Ctrl+d // to detatch
  screen -r //to reatatch

## Brain-storming belts/lessons:
### God is LOVE.
### God, the Great Inventor.
He created everything.
We belong to Him and He makes the rules!
### Prayer: You can Talk to God about Anything.
It's not a formula or a spell. God wants to hear about our lives.
He wants us to trust that He can make a difference.
### Born for Glory: God's Glory
### Jesus has made God's Forgiveness Available to Everyone. // 
Although selfish, sinful choices naturally build a wall between us and God, Jesus' personal sacrifice has made forgiveness 
### God's Spirit can help You Live for Him.
### Identity and purpose
