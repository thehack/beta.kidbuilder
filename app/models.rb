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
  property :score, Integer
  property :coins, Integer
  property :animal, String
  belongs_to :group
  has n, :verses, :through => Resource
end

class Verse
  include DataMapper::Resource
  property :id, Serial
  property :body, Text
  property :reference, String
  property :all_words, Csv
  property :belt_color, String
  has n, :users, :through => Resource
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
  has n, :users
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
  property :title, String
  property :phrase, String
  property :letters, String
  property :row1, String
  property :row2, String
  property :row3, String
  property :row4, String
  property :row5, String
  property :row6, String
  property :created_on, DateTime
  property :updated_at, DateTime
end

class Verse
  include DataMapper::Resource
  property :id, Serial
end

class Puzzle
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, String
  property :font, String
  property :font_size, String
  property :background_image, String
  property :foreground_image, String
  property :foreground_offset, Integer
  property :part_one, String
  property :part_one, String
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
