# Controller actions for Verse
get '/:name/verses/new' do
  erb :verse_new
end

get '/:name/verses/:id/show' do
  @verse = Verse.get(params[:id])
  erb :verse_show
end

get '/:name/verses/:id/edit' do
  erb :verse_edit
end

post '/:name/verses/create' do
end

post '/:name/verses/:id/destroy' do
  @verse = Verse.get(params[:id])
end

post '/:name/verses/:id/update' do
  @verse = Verse.get(params[:id])
end
