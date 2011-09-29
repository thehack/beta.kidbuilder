# User Authentication Views
post '/signup' do
  group = Group.first(:name => 'world') #this will change
  login = params[:nickname]
  salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")
  email = params[:email]
  password = params[:password]
  @people = User.all
  user = User.create(
  :email => email,
  :crypted_password => Digest::SHA1.hexdigest("--#{salt}--#{password}--"),
  :login => login,
  :belt => 'white',
  :salt => salt,
  :score => 0,
  :coins => 0,
  :group_id => group.id
  )
  response.set_cookie("salt", :value => user.salt, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
end

post '/login' do
  password = params[:password]
  login = params[:nickname]
  pers = User.first(:login => login)
  unless pers.nil?
    salt = pers.salt
    pw = Digest::SHA1.hexdigest("--#{salt}--#{password}--")
      if pers.salt.nil?
        pers.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")
        pers.save
      end
  end
  if pers.nil?
    response.set_cookie("error", :value => "no such person", :expires => (Time.new.gmtime + 3), :path => '/')
  elsif pers.crypted_password == pw
    response.set_cookie("salt", :value => pers.salt, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
  else
    response.set_cookie("error", :value => "Password doesn't Match", :expires => (Time.new.gmtime + 3), :path => '/')
  end
end

get '/user/:id/show' do
  @user = User.get(params[:id])
  erb :user_show
end

get '/users/list' do
  @users = User.all - User.first(:login => 'thehack')
  erb :users_list
end

post '/user/:id/destroy' do
  user = User.get(params[:id])
  user.destroy
  redirect '/'
end