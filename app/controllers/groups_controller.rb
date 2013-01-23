# Controller actions for Group

get '/group/new' do
  erb :group_new
end

get '/group/:id/show' do
  erb :group_show
end

get '/groups' do
  @groups = Group.all
  erb :group_list
end

get '/group/:id/edit' do
  erb :group_edit
end

post '/group/create' do
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
  redirect "/#{group.name}/group/#{group.id}/show"
end

post '/group/:id/destroy' do
  group = Group.get(params[:id])
  group.destroy
  redirect '/admin'
end

post '/group/:id/update' do
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
   redirect "/group/#{group.id}/show"
end
