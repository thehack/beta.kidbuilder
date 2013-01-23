require 'RMagick'
include Magick
require 'base64'

post '/puzzle/upload' do
  puzzle_title = params[:puzzleTitle]
  puzzle = Puzzle.create( :title => puzzle_title)

#required variables and methods  
  def double_digit(num)
    if num.to_s.length < 2
      "0" + num.to_s
    else
      num.to_s
    end
  end


  puts "puzzleTitle= " + puzzle_title

# open a create one file  
  File.open('public/images/' + puzzle_title +'.png', 'wb') do |f|
    f.write(Base64.decode64(params[:base64]))
    f.close()
  end

# chop it up
    file = Magick::ImageList.new('public/images/'+ puzzle_title + '.png')
    FileUtils.mkdir_p "public/images/puzzles/#{puzzle_title}"
    i = 0
    x = -94
    for i in 1..10
      x += 94
      newfile = file.crop(x,0,94,400)
      newfile.write("public/images/puzzles/#{puzzle_title}/#{puzzle_title + double_digit(i)}.png")
    end

"#{puzzle.id}"
  
end

# Controller actions for Puzzle
get '/puzzle/new' do
  erb :puzzle_new, :layout => false
end

get '/puzzle/:id/show' do
  @puzzle = Puzzle.get(params[:id])
  @title = @puzzle.title
  @puzzle_tiles = (Dir.entries("./public/images/puzzles/#{@title}").sort) - ['.', '..', '.DS_Store']
  erb :puzzle_show
end

get '/backgrounds/list' do
  @background_list = (Dir.entries("./public/images/backgrounds").sort) - ['.', '..', '.DS_Store']
  erb :backgrounds_list, :layout => false
end

get '/puzzles' do
  @puzzles = Puzzle.all
  erb :puzzle_list
end

get '/puzzle/:id/edit' do
  erb :puzzle_edit  
end

post '/puzzle/:id/destroy' do
  @puzzle = Puzzle.get(params[:id])
end

post '/puzzle/:id/update' do
  @puzzle = Puzzle.get(params[:id])
end

