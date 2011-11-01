# Controller actions for TileGame
get '/tile_games/new' do
  erb :tile_game_new
end

get '/tile_games/:id/show' do  
  @tile_game = TileGame.get(params[:id])
  erb :tile_game_show
end

get '/tile_games/list' do
  @tile_games = TileGame.all
  erb :tile_game_list
end

get '/tile_games/:id/edit' do
  erb :tile_game_edit
end

post '/tile_games/create' do
  s = params[:phrase]
  lines = []
  cnt = 0
  s.upcase!
#split the phrase into a list of words, stuff each line as full as possible with words.
  s.gsub(/[(,?!\'":;.)]/, '').split(" ").each { |w|
    lines[cnt] ||= ''
    cnt = cnt + 1 if ( ( lines[cnt].length + w.length + 1) > 12 && lines[cnt]!='' )
    lines[cnt] ||= ''
    lines[cnt] << w + " "
  }
  rows = []
# figure out how many blanks go at the beginning and end of each row.
  lines.each do |l|
    prepend_spaces = ((12 - l.length)*0.5).round
    append_spaces = 12- (prepend_spaces + l.length)
    rows << " " * prepend_spaces + l + " " * append_spaces
  end
# figure out how many blank rows go at the beginning and end of the puzzle.
  add_to_start = (6 - rows.length)/2
  add_to_end = 6 - (rows.length + add_to_start)
  add_to_start.times { rows.unshift([" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]) }
  add_to_end.times { rows << [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
  game = TileGame.new
  game.title = params[:title]
  game.row1 = rows[0]
  game.row2 = rows[1]
  game.row3 = rows[2]
  game.row4 = rows[3]
  game.row5 = rows[4]
  game.row6 = rows[5]
  game.created_on = Time.now
  game.updated_at = Time.now
  game.save
  redirect '/admin'
end

post '/tile_games/:id/destroy' do
  game = TileGame.get(params[:id])
  game.destroy
end

post '/tile_games/:id/update' do
  @tile_game = TileGame.get(params[:id])
end
