# Configure DataMapper to use the App Engine datastore 
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

class Level
  include DataMapper::Resource
  property :id, Serial
  property :group, String
  property :title, String
  property :subtitle, String
  property :body, Text
  property :created_on, DateTime
  property :updated_at, DateTime
end
DataMapper.auto_upgrade!
