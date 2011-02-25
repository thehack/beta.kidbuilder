# Configure DataMapper to use the App Engine datastore 
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/kidbuilder.sqlite3")

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :nickname, String
  property :password, String
  property :scramble, String
  property :belt, String
end

DataMapper.auto_upgrade!
