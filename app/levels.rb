get '/levels/new' do
  @levels = Level.all
  @verses = Verse.all
  @tile_games = TileGame.all
  @puzzles = Puzzle.all
  erb :level_new
end

get '/levels/:id/show' do
  @level = Level.get(params[:id])
  erb :level_show
end

get '/levels/list' do
  @levels = Level.all
  erb :level_list
end

get '/levels/:id/edit' do
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
  when "tile_games"
    tile_game = TileGame.first(:id => id)
    tile_game.index = index.to_i
    tile_game.save
    level.tileGames << tile_game
  end
    level.save 
end

post '/levels/:id/destroy' do
  @level = Level.get(params[:id])
end

post '/levels/:id/update' do
  @level = Level.get(params[:id])
end
