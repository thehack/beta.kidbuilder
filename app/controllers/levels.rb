get '/level/new' do
  @levels = Level.all
  @verses = Verse.all
  @games = Game.all
  @puzzles = Puzzle.all
  erb :level_new
end

get '/level/:id/show' do
  @level = Level.get(params[:id])
  erb :level_show
end

get '/levels' do
  @levels = Level.all
  erb :level_list
end

get '/level/:id/edit' do
  erb :level_edit
end

post '/units/:title/:index/:kind/:id/create' do
  kind = params[:kind]
  id = params[:id]
  index = params[:index]
  level = Level.first_or_create(:title => params[:title])
  case kind
    when "verses"
      verse = Verse.first(:id => id)
      verse.index = index.to_i
      verse.save
      level.verses << verse
    when "puzzles"
      puzzle = Puzzle.first(:id => id)
      puzzle.index = index.to_i
      puzzle.save
      level.puzzles << puzzle
    when "games"
      game = Game.first(:id => id)
      game.index = index.to_i
      game.save
      level.games << game
  end
    level.save 
end

post '/level/:id/destroy' do
  @level = Level.get(params[:id])
end

post '/level/:id/update' do
  @level = Level.get(params[:id])
end

# A quick and dirty pluralize method - I don't want to require ActiveSupport just for this!
class String
  def pluralize
    #the case of quizzes
    if self[-1..-1] == "z"
      self + "zes"
    else
      self + "s"
    end
  end
end

# DRY way to award completion of units (Game, Quiz, Verse, Puzzle), and levels
post '/:class_name/:id/complete' do
  if logged_in?
    class_name = params[:class_name]
    plural_class_name = class_name.pluralize
    id = params[:id]
    unit = eval(class_name.capitalize + ".get(" + id + ")")
    user = @current_user
    level = unit.level
    # have they already completed the quiz?
    if eval("user." + plural_class_name + ".include? unit")
    else
      eval("user." + plural_class_name + " << unit")
      user.save
      # if they have all the units in the level give them the level
      if (level.units - user.units).empty?
        user.levels << level
        user.save
      end
    end
  end
  # a redirect url goes here
  # if user not logged in, go to the next similar item or back to user's profile.
  # if user is logged in go to the next unit or the next level if all units are completed
  # how to look up next unit: 
  # next_index = unit.index +1
  # next_unit = unit.level.units[next_index]
  # next_unit_url = "/" + next.unit.class.to_s + "/" + next_unit.id + "/show" 
end
