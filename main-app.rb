require 'sinatra'
require 'datamapper'
require 'database_config'
require "digest/sha1"

Dir['./app/**/*.rb'].each{ |f| require f } #Require controllers and models in app folder


before do
  # For user authentication. Gets a unique cookie from the client and returns a global current user to the views.
  def logged_in?
    client_id = request.cookies["scramble"]
    if client_id.nil?
      return false
    else
      @current_user = User.first(:scramble => client_id)
    end
  end
  # Common variables for the layout
  @five_games = @tile_games = TileGame.all( :limit => 3, :order => [ :updated_at.desc] )
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
    redirect '/world'
end

get '/:name' do
  @users = User.all
  @first_few = User.all(:limit => 5, :order => [ :id.desc ])
  @group = Group.first(:name => params[:name])
  erb :index
end

get '/:name/admin' do
  @group = Group.first(:name => params[:name])
  @badges = Badge.all
  @levels = Level.all
  @puzzles = Puzzle.all
  @quizzes = Quiz.all
  @tile_games = TileGame.all
  @users = User.all
  @verses = Verse.all
  erb :admin
end
