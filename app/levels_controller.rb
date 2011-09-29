# Controller actions for Level
get '/levels/new' do
  erb :level_new
end

get '/levels/:id/show' do
  @level = Level.get(params[:id])
  erb :level_show
end

get '/levels/list' do
  @levels = Level.all
  erb :level_list
end

get '/levels/:id/edit' do
  erb :level_edit
end

post '/levels/create' do
end

post '/levels/:id/destroy' do
  @level = Level.get(params[:id])
end

post '/levels/:id/update' do
  @level = Level.get(params[:id])
end
