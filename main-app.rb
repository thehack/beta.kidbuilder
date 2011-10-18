require 'sinatra'
require 'datamapper'
require 'database_config'
require "digest/sha1"

Dir['./app/**/*.rb'].each{ |f| require f } #Require controllers and models in app folder
before do
  # For user authentication. Gets a unique cookie from the client and returns a global current user to the views.  
  def logged_in?
    client_id = request.cookies["salt"]
    if client_id.nil?
      return false
    else
      @current_user = User.first(:salt => client_id)
    end
  end
  # Common variables for the layout
  if logged_in?
    @group = @current_user.group
  else
    @group = Group.first(:name => 'world')
  end
  @five_games = TileGame.all( :limit => 5, :order => [ :updated_at.desc ] )
  @five_bbbs = Verse.all( :limit => 5, :order => [ :updated_at.desc ] )
  @five_puzzles = Puzzle.all( :limit => 5, :order => [ :updated_at.desc ] )
  @belts = %w[white yellow green red purple black]
end

helpers do
  include Rack::Utils
  # Make sure our template can use <%=h %>
  alias_method :h, :escape_html
  # Partials: Usage: partial :foo
  def partial(page, options={})
    erb page, options.merge!(:layout => false)
  end
end

get '/' do
  @users = User.all
  @first_few = User.all(:limit => 5, :order => [ :id.desc ])
  erb :index
end

get '/admin' do
  @badges = Badge.all
  @levels = Level.all
  @puzzles = Puzzle.all
  @quizzes = Quiz.all
  @tile_games = TileGame.all
  @users = User.all
  @verses = Verse.all
  erb :admin
end


disable :logging #This was causing everything to output twice to console.