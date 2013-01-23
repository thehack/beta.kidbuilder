# Controller actions for Game
get '/game/new' do
  erb :game_new
end

get '/game/:id/show' do  
  @game = Game.get(params[:id])
  erb :game_show
end

get '/games' do
  @games = Game.all
  erb :game_list
end

get '/game/:id/edit' do
  erb :game_edit
end

post '/game/create' do
  s = params[:phrase]
  lines = []
  count = 0
  s.upcase!
#split the phrase into a list of words, stuff each line as full as possible with words.
  s.gsub(/[(,?!\'":;.)]/, '').split(" ").each { |w|
    lines[count] ||= ''
    count = count + 1 if ( ( lines[count].length + w.length + 1) > 12 && lines[count]!='' )
    lines[count] ||= ''
    lines[count] << w + " "
  }
  rows = []
# how many blanks go at the beginning and end of each row?
  lines.each do |l|
    prepend_spaces = ((12 - l.length)*0.5).round
    append_spaces = 12- (prepend_spaces + l.length)
    rows << " " * prepend_spaces + l + " " * append_spaces
  end
# how many blank rows go at the beginning and end of the puzzle?
  add_to_start = (6 - rows.length)/2
  add_to_end = 6 - (rows.length + add_to_start)
  add_to_start.times { rows.unshift([" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]) }
  add_to_end.times { rows << [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
  game = Game.new
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

post '/game/:id/destroy' do
  game = Game.get(params[:id])
  game.destroy
end

post '/game/:id/update' do
  @game = Game.get(params[:id])
end
