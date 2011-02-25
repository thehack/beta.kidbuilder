# User Authentication Views
post '/signup' do
  email = params[:email]
  password = params[:password].crypt('h3')
  @people = User.all
  user = User.create(
  :email => email,
  :scramble => email.crypt('h3'),
  :nickname => params[:nickname],
  :password => password,
  :belt => 'white' )
  response.set_cookie("scramble", :value => user.scramble, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
end

get '/signup' do
  partial :signup
end

get '/login' do
  partial :login
end

post '/login' do
  pw = params[:loginpassword].crypt('h3')
  pers = User.first(:email => params[:loginemail])
  if pers.nil?
    response.set_cookie("error", :value => "no such person", :expires => (Time.new.gmtime + 3), :path => '/')
  elsif pers.password == pw
    response.set_cookie("scramble", :value => pers.scramble, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
  else
    response.set_cookie("error", :value => "Password doesn't Match", :expires => (Time.new.gmtime + 3), :path => '/')
  end
  redirect '/'
end