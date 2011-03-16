require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'database_config'
require "digest/sha1"

Dir['./app/**/*.rb'].each{ |f| require f } #Require controllers and models in app folder

# For user authentication
before do
  def logged_in?
    client_id = request.cookies["scramble"]
    if client_id.nil?
      return false
    else
      @current_user = User.first(:scramble => client_id)
    end
  end
  
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