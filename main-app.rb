require 'rubygems'
require 'sinatra'
require 'data_mapper'
require './database_config'
require 'digest/sha1'
require 'sinatra/flash'

# move views to app/views
set :views, Proc.new { File.join(root, "app/views") }

# use Rack::Flash
enable :sessions

#Require controllers and models in app folder
Dir['./app/**/*.rb'].each{ |f| require f } 
before do
  def authenticate!
    unless admin?
    flash[:notice] = "You must be a logged-in administrator to do that!"    
     redirect "/"
    end
  end
  
  # For user authentication. Gets a unique cookie from the client and returns a global current user to the views.  
  def logged_in?
    client_id = request.cookies["salt"]
    if client_id.nil?
      return false
    else
      @current_user = User.first(:salt => client_id)
    end
  end
  def admin?
    if logged_in? && @current_user.login == "thehack"
      return true
    else
      return false
    end
  end
  # Common variables for the layout
  @levels = Level.all
  @eight_games = Game.all( :limit => 8, :order => [ :updated_at.desc ] )
  @eight_bbbs = Verse.all( :limit => 8, :order => [ :updated_at.desc ] )
  @eight_puzzles = Puzzle.all( :limit => 8, :order => [ :updated_at.desc ] )
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

# DRY authentication
before /^.*(new|edit|create|admin|destroy|upload)$/, :mustermann_opts => { :type => :regexp, :check_anchors => false } do
  authenticate!
end


get '/' do
  @users = User.all
  @first_few = User.all(:limit => 5, :order => [ :id.desc ])
  erb :index
end

get '/admin' do
  if admin?
    @badges = Badge.all
    @levels = Level.all
    @puzzles = Puzzle.all
    @quizzes = Quiz.all
    @games = Game.all
    @users = User.all
    @verses = Verse.all
    erb :admin
  else
    response.set_cookie("error", :value => "You have to be a logged-in administrator to do that.", :expires => (Time.new.gmtime + 3), :path => '/')
    redirect "/"
  end
end


disable :logging #This was causing everything to output twice to console.
