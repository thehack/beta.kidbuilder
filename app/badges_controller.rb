# Controller actions for Badge
get '/badges/new' do
  erb :badge_new
end

get '/badges/:id/show' do
  @badge = Badge.get(params[:id])
  erb :badge_show
end

get '/badges/list' do
  @badges = Badge.all
  erb :badge_list
end

get '/badges/:id/edit' do
  erb :badge_edit
end

post '/badges/create' do
end

post '/badges/:id/destroy' do
  @badge = Badge.get(params[:id])
end

post '/badges/:id/update' do
  @badge = Badge.get(params[:id])
end