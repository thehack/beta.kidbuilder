#copy over sounds, images, fix urls in javascript in bbb_show
post '/verse/create' do
  body = params[:body]
  verse = Verse.create(	    :body	  => body,
  													:reference => params[:reference],
  													:all_words => body.gsub(/[!.?,:;"]|\[.\]/ , "").split,
  													:belt_color => params[:belt])
  redirect '/admin'
end

get '/verse/*/edit' do
#  @belts = [:white, :yellow, :orange, :green, :blue, :brown, :black]
	@verse = Verse.get(params['splat'])
	erb :edit
end

post '/verse/*/destroy' do
	verse = Verse.get(params['splat'])
	verse.destroy
	redirect '/admin'
end

post '/verse/*/update' do
#  @belts = [:white, :yellow, :orange, :green, :blue, :brown, :black]
  # :belt is the stated belt.id value from the form. 
  verse = Verse.get(params['splat'])
  body = params[:body]
  verse.update(	            :body	  => body,
  													:reference => params[:reference],
  													:all_words => body.gsub(/[!.?,:;"]|\[.\]/ , "").split,
  													:belt_color => params[:belt]
  )
  redirect '/admin'
end

post '/:name/bbb/*/award' do
  if logged_in?
    belts = %w[white yellow green red purple black]
    verse = Verse.get(params['splat'])
    @current_user.verses << verse
    verse.users << @current_user
    verse.save
    @current_user.save
    belt_attempt = belts[(belts.index(@current_user.belt) + 1)]
    belt_verses = Verse.all(:belt_color => belt_attempt)
    @user_verses = @current_user.verses
    user_belt_verses = @user_verses & belt_verses
    if belt_verses.count == user_belt_verses.count
        @current_user.belt = belt_attempt
    end
    @current_user.save
  else
  "you are not logged in."
  end  
end

get '/:name/bbb/profile' do
  @group = Group.first(:name => params[:name])
  
  if logged_in?
    @versecount = @current_user.verses.length
    @belt_attempt = @belts[(@belts.index(@current_user.belt) + 1)]    
    @beltverses = Verse.all(:belt_color => @belt_attempt)
    @completedverses = @current_user.verses
    erb :bbb_profile
  else
    redirect '/'
  end
end

get '/:name/bbb/*/show' do
  @group = Group.first(:name => params[:name])
  @verse = Verse.get(params['splat'])
  @seconds = @verse.all_words.length/2
  @blanks = 0
  @correct = 100
  @redirect_url = "/" + @group.name + "/bbb/" + @verse.id.to_s + "/easy"
  @verse_layout = @verse.body
  erb :bbb_show
end

get '/:name/bbb/*/easy' do
  @group = Group.first(:name => params[:name])
  @verse = Verse.get(params['splat'])
  @redirect_url = "/" + @group.name + "/bbb/" + @verse.id.to_s + "/medium"
  @success = "<center><iframe src='/animations/ape.html' scrolling='no' frameborder='0' width='940' height='400'><p>Your browser does not support iframes.</p></iframe></center>"
  words = @verse.all_words
  word_count = words.length
  @blanks = word_count/6
  word_indexes = (0..(word_count - 1)).to_a.sort_by { rand }
  fields = words.collect { |word| "<input type='text' id='#{word}' style='width: #{(word.to_s.length)*40}px;'>"}
  set = word_indexes[0..(@blanks -1)]
  bucket = []
  set.each do |wi|
    bucket << words[wi]
    words[wi] = fields[wi]
  end 
  @verse_layout = words.join(" ")
  @correct = bucket.uniq.length
  erb :bbb_show
end

get '/:name/bbb/*/medium' do
  @group = Group.first(:name => params[:name])
  
  @verse = Verse.get(params['splat'])
  @redirect_url = "/" + @group.name + "/bbb/" + @verse.id.to_s + "/hard"
  @success = "<center><iframe src='/animations/ape.html' scrolling='no' frameborder='0' width='940' height='400'><p>Your browser does not support iframes.</p></iframe></center>"
  words = @verse.all_words
  word_count = words.length
  @blanks = word_count/2
  word_indexes = (0..(word_count - 1)).to_a.sort_by { rand }
  fields = words.collect { |word| "<input type='text' id='#{word}' style='width: #{(word.to_s.length)*40}px;'>"}
  set = word_indexes[0..(@blanks -1)]
  bucket = []
  set.each do |wi|
    bucket << words[wi]
    words[wi] = fields[wi]
  end 
  @verse_layout = words.join(" ")
  @correct = bucket.uniq.length
  erb :bbb_show
end

get '/:name/bbb/*/hard' do
  @group = Group.first(:name => params[:name])
  
  @verse = Verse.get(params['splat'])
  @redirect_url = "/" + @group.name + "/bbb/profile"
  @success = "<center><iframe src='/animations/ape.html' scrolling='no' frameborder='0' width='940' height='400'><p>Your browser does not support iframes.</p></iframe></center>"
  words = @verse.all_words
  word_count = words.length
  @blanks = word_count
  word_indexes = (0..(word_count - 1)).to_a.sort_by { rand }
  fields = words.collect { |word| "<input type='text' id='#{word}' style='width: #{(word.to_s.length)*40}px;'>"}
  set = word_indexes[0..(@blanks -1)]
  bucket = []
  set.each do |wi|
    bucket << words[wi]
    words[wi] = fields[wi]
  end 
  @verse_layout = words.join(" ")
  @correct = bucket.uniq.length
  erb :bbb_show
end


get '/:name/bbb/select_character' do
  @group = Group.first(:name => params[:name])
  if logged_in?
    partial :bbb_character
  end
end

post '/:name/bbb/*/animal' do
  if logged_in?
  @current_user.update(:animal => params['splat'])
  end  
end