#copy over sounds, images, fix urls in javascript in bbb_show
post '/verse/create' do
  body = params[:body]
  verse = Verse.create(	    :title => params[:title],
                            :body	  => body,
  													:belt_color => params[:belt])
  redirect '/admin'
end

get '/verse/*/edit' do
	@verse = Verse.get(params['splat'])
	erb :edit
end

post '/verse/*/destroy' do
	verse = Verse.get(params['splat'])
	verse.destroy
	redirect '/admin'
end

post '/verse/*/update' do
  verse = Verse.get(params['splat'])
  body = params[:body]
  verse.update(	            :body	  => body,
  													:title => params[:title],
  													:all_words => body.gsub(/[!.?,:;"]|\[.\]/ , "").split,
  													:belt_color => params[:belt]
  )
  redirect '/admin'
end

get '/bbb/profile' do  
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

get '/verse/*/show' do
  #this needs to be optimized.
  cookie = request.cookies["difficulty"]
  @verse = Verse.get(params['splat'])
  case cookie
    when "easy"
      @verse = Verse.get(params['splat'])
      @redirect = "window.location.reload();"
      @success = "<center><iframe src='/animations/ape.html' scrolling='no' frameborder='0' width='940' height='400'><p>Your browser does not support iframes.</p></iframe></center>"
      words = @verse.all_words
      word_count = words.length
      @blanks = word_count/6
      word_indexes = (0..(word_count - 1)).to_a.sort_by { rand }
      fields = words.collect { |word| "<input type='text' class='bbbInput' rel='"+ word+"' style='width: #{(word.length)*40}px;'>"}
      set = word_indexes[0..(@blanks -1)]
      bucket = []
      set.each do |wi|
        bucket << words[wi]
        words[wi] = fields[wi]
      end 
      @verse_layout = words.join(" ")
      @correct = bucket.length
      @difficulty = "medium"
    when "medium"
      @redirect = "window.location.reload();"
      @success = "<center><iframe src='/animations/ape.html' scrolling='no' frameborder='0' width='940' height='400'><p>Your browser does not support iframes.</p></iframe></center>"
      words = @verse.all_words
      word_count = words.length
      @blanks = word_count/2
      word_indexes = (0..(word_count - 1)).to_a.sort_by { rand }
      fields = words.collect { |word| "<input type='text' class='bbbInput' rel='#{word}' style='width: #{(word.to_s.length)*40}px;'>"}
      set = word_indexes[0..(@blanks -1)]
      bucket = []
      set.each do |wi|
        bucket << words[wi]
        words[wi] = fields[wi]
      end 
      @verse_layout = words.join(" ")
      @correct = bucket.length
      @difficulty = "hard"
    when "hard"
      @verse = Verse.get(params['splat'])
      @redirect = ""
      @success = "<center><iframe src='/animations/ape.html' scrolling='no' frameborder='0' width='940' height='400'><p>Your browser does not support iframes.</p></iframe></center>"
      words = @verse.all_words
      word_count = words.length
      @blanks = word_count
      word_indexes = (0..(word_count - 1)).to_a.sort_by { rand }
      fields = words.collect { |word| "<input type='text' class='bbbInput' rel='#{word}' style='width: #{(word.to_s.length)*40}px;'>"}
      set = word_indexes[0..(@blanks -1)]
      bucket = []
      set.each do |wi|
        bucket << words[wi]
        words[wi] = fields[wi]
      end 
      @verse_layout = words.join(" ")
      @correct = bucket.length
      @difficulty = ""
    when nil, ""
      @verse = Verse.get(params['splat'])
      @seconds = @verse.all_words.length/2
      @blanks = 0
      @correct = 100
      @redirect = "window.location.reload();"
      @verse_layout = @verse.body
      @difficulty = "easy"
    end
  erb :bbb_show
end


get '/bbb/select_character' do
  if logged_in?
    partial :bbb_character
  end
end

post '/bbb/*/animal' do
  if logged_in?
  @current_user.update(:animal => params['splat'])
  end  
end

