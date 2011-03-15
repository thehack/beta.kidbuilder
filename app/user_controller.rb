# User Authentication Views
post '/signup' do
  login = params[:nickname]
  salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")
  email = params[:email]
  password = params[:password]
  @people = User.all
  user = User.create(
  :email => email,
  :crypted_password => Digest::SHA1.hexdigest("--#{salt}--#{password}--"),
  :scramble => email.crypt('h3'),
  :login => login,
  :belt => 'white',
  :salt => salt,
  :points => 0,
  :coins => 0
  )
  response.set_cookie("scramble", :value => user.scramble, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
end

post '/login' do
  password = params[:password]
  pers = User.first(:login => params[:nickname])
  unless pers.nil?
    salt = pers.salt
    pw = Digest::SHA1.hexdigest("--#{salt}--#{password}--")
      if pers.scramble.nil?
        pers.scramble = pers.email.crypt('h3')
        pers.save
      end
  end
  if pers.nil?
    response.set_cookie("error", :value => "no such person", :expires => (Time.new.gmtime + 3), :path => '/')
  elsif pers.crypted_password == pw
    response.set_cookie("scramble", :value => pers.scramble, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
  else
    response.set_cookie("error", :value => "Password doesn't Match", :expires => (Time.new.gmtime + 3), :path => '/')
  end
  redirect '/'
end

get '/:name/user/:id/show' do
  @user = User.get(params[:id])
  erb :user_show
end

get '/:name/users/list' do
  @group = Group.first(:name => params[:name])
  @users = User.all - User.first(:login => 'thehack')
  erb :users_list
end

post '/:name/user/:id/destroy' do
  user = User.get(params[:id])
  user.destroy
  redirect '/'
end