# Controller actions for Puzzle
get '/:name/puzzles/new' do
  erb :puzzle_new
end

get '/:name/puzzles/:id/show' do
  @puzzle = Puzzle.get(params[:id])
  erb :puzzle_show
end

get '/:name/puzzles/list' do
  @puzzles = Puzzle.all
  erb :puzzle_list
end

get '/:name/puzzles/:id/edit' do
  erb :puzzle_edit
end

post '/:name/puzzles/create' do
end

post '/:name/puzzles/:id/destroy' do
  @puzzle = Puzzle.get(params[:id])
end

post '/:name/puzzles/:id/update' do
  @puzzle = Puzzle.get(params[:id])
end
