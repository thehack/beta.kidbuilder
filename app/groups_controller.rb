# Controller actions for Group

get '/groups/new' do
  erb :group_new
end

get '/groups/:id/show' do
  erb :group_show
end

get '/groups/list' do
  @groups = Group.all
  erb :group_list
end

get '/groups/:id/edit' do
  erb :group_edit
end

post '/groups/create' do
    administrator = @current_user.login
    name = params[:name]
    group = Group.create(
     :administrator => administrator,
     :email => @current_user.email,
     :name => params[:group_name],
     :logo => params[:logo],
     :color1 => params[:color1],
     :color2 => params[:color2],
     :color3 => params[:color3],
     :color4 => params[:color4],
     :color5 => params[:color5],
     :color6 => params[:color6],
     :created_on => Time.now,
     :updated_at => Time.now
    )
    @current_user.group = name
    @current_user.save
  redirect "/#{group.name}/groups/#{group.id}/show"
end

post '/groups/:id/destroy' do
  group = Group.get(params[:id])
  group.destroy
  redirect '/admin'
end

post '/groups/:id/update' do
   group.name = @group
   group.logo = params[:logo]
   group.color1 = params[:color1]
   group.color2 = params[:color2]
   group.color3 = params[:color3]
   group.color4 = params[:color4]
   group.color5 = params[:color5]
   group.color6 = params[:color6]
   group.updated_at = Time.now
   group.save
   redirect "/groups/#{group.id}/show"
end
