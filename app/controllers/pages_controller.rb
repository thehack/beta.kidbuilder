# Controller actions for Quiz
get '/page/new' do
  erb :page_new
end

get '/quiz/:id/show' do
  page = Page.get(params[:id])
  @rows = page.rows.all(:order => [:index.asc])
  erb :quiz_show
end

get '/pages' do
  @pages = Page.all
  erb page_list
end

get '/quiz/:id/edit' do
  erb :quiz_edit
end

post '/page/create' do
end

post '/page/:id/destroy' do
  page = Page.get(params[:id])
end

post '/page/:id/update' do
  @page = Quiz.get(params[:id])
end

