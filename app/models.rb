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

class Group
  include DataMapper::Resource
  property :id, Serial
  property :administrator, String
  property :email, String
  property :name, String, :required => true
  property :logo, String
  property :color1, String
  property :color2, String
  property :color3, String
  property :color4, String
  property :color5, String
  property :color6, String
  property :created_on, DateTime
  property :updated_at, DateTime
end

class Badge
  include DataMapper::Resource
  property :id, Serial
end

class Quiz
  include DataMapper::Resource
  property :id, Serial
end

class TileGame
  include DataMapper::Resource
  property :id, Serial
end

class Verse
  include DataMapper::Resource
  property :id, Serial
end

class Puzzle
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :reference, String
  property :part_one, String
  property :part_two, String
  property :part_three, String
  property :part_four, String
  property :part_five, String
  property :part_six, String
  property :part_seven, String
  property :part_eight, String
  property :part_nine, String
  property :part_ten, String
  property :big_image, String
  property :created_on, DateTime
  property :updated_at, DateTime
end
DataMapper.auto_upgrade!
