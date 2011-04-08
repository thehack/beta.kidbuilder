require 'RMagick'
include Magick

# Controller actions for Puzzle
get '/:name/puzzles/new' do
  @group = Group.first(:name =>params[:name])
  @fontlist = Dir.entries("#{Dir.pwd}/public/fonts").collect { |f| "/fonts/#{f}" }
	
  erb :puzzle_new
end

get '/:name/puzzles/:id/show' do
  @puzzle = Puzzle.get(params[:id])
  @group = Group.first(:name => params[:name])
  
  erb :puzzle_show
end

get '/:name/puzzles/list' do
  @group = Group.first(:name => params[:name])
  
  @puzzles = Puzzle.all
  erb :puzzle_list
end

get '/:name/puzzles/:id/edit' do
  erb :puzzle_edit
end

post '/:name/puzzles/create' do
  @group = Group.first(:name => params[:name])  
  font = params[:font]
  verse = params[:verse].split(" ")
  reference = params[:reference]
  title = reference.gsub(" ", "")
  
  # create the directory.
  FileUtils.mkdir_p("#{Dir.pwd}/public/groupfiles/#{@group.name}/puzzles/#{title}")
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
  #find out which line is longest
  line_lengths = [l1txt.length, l2txt.length, l3txt.length, l4txt.length]
  longest_line_in_characters = line_lengths.max
  vertical = [(700/line_lengths.max), 24].max
  layer1.pointsize = vertical
  layer1.text(350, vertical*1.5, l1txt)
  layer1.text(350, vertical*3, l2txt)
  layer1.text(350, vertical*4.5, l3txt)
  layer1.text(350, vertical*6, l4txt)
  layer1.text(350, vertical*7.5, l5txt)
  
  #find out how many pixels wide the longest line is and scale.
  #get back the text of the longest line
  width  = layer1.get_type_metrics(canvas, [l1txt, l2txt, l3txt, l4txt][line_lengths.index(longest_line_in_characters)]
  ).width
  layer1.text(350, vertical*9, width.to_s + 'px')
  canvas = canvas.composite(clown, 50, vertical, Magick::OverCompositeOp)
  layer1.draw(canvas)
  canvas.write("#{Dir.pwd}/public/groupfiles/#{@group.name}/puzzles/#{title}/#{title}_big.gif")

  
#chop 'em up.
  
#  puts "usage: chopper.rb [directory location, basefilename] "
#  i = 0
#  x = -74
#  for i in 1..10
#    x += 74
#    newfile = canvas.crop(x,0,74,400)
 #   newfile.write("#{Dir.pwd}/public/groupfiles/#{@group.name}/puzzles/title/#{title + i.to_s}.png")
#  end
  puzzle = Puzzle.create( :title => title,
                          :background_image => background_image,
                          :foreground_image => foreground_image,
                          :background_color => background_color,
                          :font => font,
                          :font_size => font_size,
                          :big_image => "/groupfiles/#{@group.name}/puzzles/#{title}/#{title}_big.gif" )
  redirect "/#{@group.name}/puzzles/#{puzzle.id}/show"
end

post '/:name/puzzles/:id/destroy' do
  @puzzle = Puzzle.get(params[:id])
end

post '/:name/puzzles/:id/update' do
  @puzzle = Puzzle.get(params[:id])
end
