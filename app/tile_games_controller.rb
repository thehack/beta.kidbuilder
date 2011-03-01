# Controller actions for Tile_game
get '/:name/tile_games/new' do
  erb :tile_game_new
end

get '/:name/tile_games/:id/show' do
  @tile_game = Tile_game.get(params[:id])
  erb :tile_game_show
end

get '/:name/tile_games/list' do
  @tile_games = Tile_game.all
  erb :tile_game_list
end

get '/:name/tile_games/:id/edit' do
  erb :tile_game_edit
end

post '/:name/tile_games/create' do
end

post '/:name/tile_games/:id/destroy' do
  @tile_game = Tile_game.get(params[:id])
end

post '/:name/tile_games/:id/update' do
  @tile_game = Tile_game.get(params[:id])
end
