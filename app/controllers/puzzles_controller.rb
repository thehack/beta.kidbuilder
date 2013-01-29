require 'base64'

post '/puzzle/upload' do
  puzzle_title = params[:puzzleTitle]
  puzzle = Puzzle.create( :title => puzzle_title)  
  slices = params[:slices]
  FileUtils.mkdir_p "public/images/puzzles/#{puzzle_title}"
  i = 0 #a counter

  #required variables and methods  
  def double_digit(num)
    if num.to_s.length < 2
      "0" + num.to_s
    else
      num.to_s
    end
  end

  # save the array of image data to files
  for slice in slices
    File.open("public/images/puzzles/#{puzzle_title}/#{puzzle_title + double_digit(i)}.png", 'wb') do |f|
      f.write(Base64.decode64(slice))
      f.close()
      i += 1
    end
  end
  "#{puzzle.id}"
end

# Controller actions for Puzzle
get '/puzzle/new' do
  @background_list = (Dir.entries("./public/images/backgrounds").sort) - ['.', '..', '.DS_Store']
  erb :puzzle_new, :layout => false
end

get '/puzzle/:id/show' do
  @puzzle = Puzzle.get(params[:id])
  @title = @puzzle.title
  @puzzle_tiles = (Dir.entries("./public/images/puzzles/#{@title}").sort) - ['.', '..', '.DS_Store']
  erb :puzzle_show
end

get '/puzzles' do
  @puzzles = Puzzle.all
  erb :puzzle_list
end

get '/puzzle/:id/edit' do
  erb :puzzle_edit  
end

post '/puzzle/:id/destroy' do
  puzzle = Puzzle.get(params[:id])
end

post '/puzzle/:id/update' do
  @puzzle = Puzzle.get(params[:id])
end

