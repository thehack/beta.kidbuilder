# Controller actions for Level
get '/:name/levels/new' do
  erb :level_new
end

get '/:name/levels/:id/show' do
  @level = Level.get(params[:id])
  erb :level_show
end

get '/:name/levels/list' do
  @levels = Level.all
  erb :level_list
end

get '/:name/levels/:id/edit' do
  erb :level_edit
end

post '/:name/levels/create' do
end

post '/:name/levels/:id/destroy' do
  @level = Level.get(params[:id])
end

post '/:name/levels/:id/update' do
  @level = Level.get(params[:id])
end
