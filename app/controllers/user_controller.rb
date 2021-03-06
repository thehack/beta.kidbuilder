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
  :login => login,
  :belt => 'white',
  :salt => salt,
  :score => 0,
  :coins => 0
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
      flash[:notice] = "No such user"  
  elsif pers.crypted_password == pw
    response.set_cookie("salt", :value => pers.salt, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
  else
    flash[:notice] = "Password doesn't match!"  
  end
end

get '/user/:id/show' do
  @user = User.get(params[:id])
  erb :user_show
end

get '/users' do
  @users = User.all - User.first(:login => 'thehack')
  erb :users_list
end

post '/user/:id/destroy' do
  user = User.get(params[:id])
  user.destroy
  redirect '/'
end