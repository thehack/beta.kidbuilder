# Configure DataMapper to use the App Engine datastore 
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/kidbuilder.sqlite3")

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :login, String
  property :crypted_password, String
  property :salt, String
  property :scramble, String
  property :belt, String
  property :points, Integer
  property :coins, Integer
  
end

DataMapper.auto_upgrade!
