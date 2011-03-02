# Controller actions for Badge
get '/:name/badges/new' do
  erb :badge_new
end

get '/:name/badges/:id/show' do
  @badge = Badge.get(params[:id])
  erb :badge_show
end

get '/:name/badges/list' do
  @badges = Badge.all
  erb :badge_list
end

get '/:name/badges/:id/edit' do
  erb :badge_edit
end

post '/badges/create' do
end

post '/badges/:id/destroy' do
  @badge = Badge.get(params[:id])
end

post '/:name/badges/:id/update' do
  @badge = Badge.get(params[:id])
end
