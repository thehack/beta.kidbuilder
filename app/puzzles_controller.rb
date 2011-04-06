require 'rmagick'

# Controller actions for Puzzle
get '/:name/puzzles/new' do
  @group = Group.first(:name => params[:name])
  @fontlist = Dir.entries("#{Dir.pwd}/public/fonts").collect { |f| "/fonts/#{f}" }
	
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
  font = params[:font]
  title = params[:title]
  verse = params[:verse].split(" ")
  reference = params[:reference]
  @group = Group.first(:name => params[:name])
  puzzle = Puzzle.create(:title => params[:title])
    FileUtils.mkdir_p(File.dirname("#{Dir.pwd}/groupfiles/#{@group.name}/puzzles/title"))
  canvas = Magick::Image.new(740, 400, Magick::HatchFill.new('white','lightcyan2'))
  clown = Magick::ImageList.new("#{Dir.pwd}/public/images/clown.jpg").first
  layer1 = Magick::Draw.new
  layer1.fill = 'black'
  layer1.font = Dir.pwd + "/public" + font
  verselength = verse.length
  words_per_line = ((verse.count.to_f)/4.0).round.to_i
  l1txt = verse[0..(words_per_line-1)].join(" ")
  l2txt = verse[words_per_line..((words_per_line*2)-1)].join(" ")
  l3txt = verse[words_per_line*2..((words_per_line*3)-1)].join(" ")
  l4txt = verse[words_per_line*3..((words_per_line*4)-1)].join(" ")
  l5txt = reference
  size = [(700/[l1txt.length, l2txt.length, l3txt.length, l4txt.length].max), 24].max
  layer1.pointsize = size
  layer1.text(350,size*1.5, l1txt)
  layer1.text(350,size*3 , l2txt)
  layer1.text(350,size*4.5 , l3txt)
  layer1.text(350,size*6 , l4txt)
  layer1.text(350,size*7.5 , l5txt)
  canvas = canvas.composite(clown, 50, size,
                                 Magick::OverCompositeOp)
  layer1.draw(canvas)

  canvas.write("#{Dir.pwd}/groupfiles/#{@group.name}/puzzles/title/title_big.png")
  
#chop 'em up.
  
  file = Magick::ImageList.new(ARGV[0])
  puts "usage: chopper.rb [directory location, basefilename] "
  name = ARGV[1]
  i = 0
  x = -74
  for i in 1..10
    x += 74
    newfile = file.crop(x,0,74,400)
    newfile.write("desktop/#{name + i.to_s}.png")
  end
  
end

post '/:name/puzzles/:id/destroy' do
  @puzzle = Puzzle.get(params[:id])
end

post '/:name/puzzles/:id/update' do
  @puzzle = Puzzle.get(params[:id])
end
