# Controller actions for Badge
get '/badge/new' do
  erb :badge_new
end

get '/badge/:id/show' do
  @badge = Badge.get(params[:id])
  erb :badge_show
end

get '/badges' do
  @badges = Badge.all
  erb :badge_list
end

get '/badge/:id/edit' do
  erb :badge_edit
end

post '/badge/create' do
end

post '/badge/:id/destroy' do
  @badge = Badge.get(params[:id])
end

post '/badge/:id/update' do
  @badge = Badge.get(params[:id])
end