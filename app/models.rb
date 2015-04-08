
class Badge
  include DataMapper::Resource
  property  :id, Serial
  property  :name, String
  property  :icon_url, String
  property  :price, Integer
  property  :group, String
  has n, :users, :through => Resource
end

class Game
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :index, Integer
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
  belongs_to :level, :required => false
  has n, :users, :through => Resource
end

class Group
  include DataMapper::Resource
  property :id, Serial
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

class Level
  include DataMapper::Resource
  def units
    # gets but doesnt set. you must do:
    # level.games << game 
    # level.save
    [self.games, self.puzzles, self.verses].flatten.sort_by { |unit| unit.index }
  end
  property :id, Serial
  property :title, String
  property :created_on, DateTime
  property :updated_at, DateTime
  has n, :users, :through => Resource
  has n, :games
  has n, :puzzles
  has n, :verses
end

class Puzzle
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :index, Integer  
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :level, :required => false
  has n, :users, :through => Resource  
end

class Page
  include DataMapper::Resource
  property :id, Serial
  property :index, Integer  
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :level, :required => false
  has n, :rows, :through => Resource  
end

class Row
  include DataMapper::Resource  
  property :id, Serial
  property :index, Integer  
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :page
  has n, :spans, :through => Resource  
end

class Span
  include DataMapper::Resource
  property :id, Serial
  property :type, String
  property :col_width, Integer
  property :content, String
  property :index, Integer
  property :src, String
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :row
  types = {
    :video => "<video src='#{self.src}'>#{self.content}</video>", 
    :image => "<img src='#{self.src}'>#{self.content}",
    :text => self.content
  }
  def generated_content
    return types[self.type.to_sym]
  end
end

class Quiz
  include DataMapper::Resource
  property :id, Serial
end

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String, :unique => true
  property :login, String, :unique => true
  property :crypted_password, String
  property :salt, String
  property :belt, String
  property :score, Integer
  property :coins, Integer
  property :animal, String
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :group
  has n, :levels, :through => Resource
  has n, :games, :through => Resource
  has n, :puzzles, :through => Resource
  has n, :verses, :through => Resource
  has n, :badges, :through => Resource
  def units
    # gets but doesnt set. you must do:
    # user.games << game
    # user.save
    [self.games, self.puzzles, self.verses].flatten.sort_by { |unit| unit.index }
  end
end

class Verse
  include DataMapper::Resource
  property :id, Serial
  property :body, Text
  property :title, String
  property :belt_color, String
  property :index, Integer
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :level, :required => false
  has n, :users, :through => Resource
  def all_words
    self.body.gsub(/[!.?,:;"]|\[.\]/ , "").split
  end
end


DataMapper.auto_upgrade!

# first user and group
if Group.all == []
  group = Group.create( :id => 1, 
    :email => "tim.inman@gmail.com",
    :name => 'world',
    :logo => 'kidbuilder2.png',
    :color1 => "666666",
    :color2 => "0F87ff",
    :color3 => '0F87ff',
    :color4 => 'f55200',
    :color5 => '8fe300',
    :color6 => 'fd00d6',
    :created_on => Time.now,
    :updated_at => Time.now )
  email = 'tim.inman@gmail.com'
  login = 'thehack'
  salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")
  password = '953NE8921'

  user = User.create(
    :email => email,
    :login => login,
    :crypted_password => Digest::SHA1.hexdigest("--#{salt}--#{password}--"),
    :salt => salt,
    :belt => 'white',
    :score => 0,
    :coins => 0,
    :created_on => Time.now,
    :updated_at => Time.now )
  group.users << user
  group.save
  puts "just created admin user in #{user.group.name}."
end
