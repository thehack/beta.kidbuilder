get '/levels/new' do
  @levels = Level.all
  @units = Unit.all
  @verses = Verse.all
  @tile_games = TileGame.all
  @puzzles = Puzzle.all
  erb :level_new
end

get '/levels/:id/show' do
  @level = Level.get(params[:id])
  erb :level_show
end

get '/units/:id/show' do
  @unit = Unit.get(params[:unit_id])
  @level = @unit.level
  kind = @unit.kind
  case kind
  when "verses"
    erb :bbb_show
  when "puzzles"
    erb :puzzle_show
  when "tile_games"
    erb :tile_game_show
  end
end

get '/levels/:id/edit' do
  erb :level_edit
end

post '/units/:title/:index/:kind/:id/create' do
  kind = params[:kind]
  id = params[:id]
  level = Level.first_or_create(:title => params[:title])
  unit = Unit.create( :index => params[:index],
                      :kind => kind)
  case kind
  when "verses"
    piece = Verse.first(:id => id)
    unit.verse = piece
  when "puzzles"
    piece = Puzzle.first(:id => id)
    unit.puzzle = piece
  when "tile_games"
    piece = TileGame.first(:id => id)
    unit.tileGame = piece
  end
    level.units << unit
    piece.save
    unit.save
    level.save 
end

post '/levels/:id/destroy' do
  @level = Level.get(params[:id])
end

post '/levels/:id/update' do
  @level = Level.get(params[:id])
end
