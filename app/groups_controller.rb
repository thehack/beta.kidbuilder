# Controller actions for Group
get '/:name/groups/new' do
  @group = Group.first(:name =>params[:name])
  erb :group_new
end

get '/:name/groups/:id/show' do
  @group = Group.get(params[:id])
  erb :group_show
end

get '/:name/groups/list' do
  @groups = Group.all
  erb :group_list
end

get '/:name/groups/:id/edit' do
  @group = Group.first(:name => params[:name])
  erb :group_edit
end

post '/groups/create' do
  if logged_in?
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
  end
  redirect "/#{group.name}/groups/#{group.id}/show"
end

post '/:name/groups/:id/destroy' do
  @group = Group.get(params[:id])
end

post '/:name/groups/:id/update' do
  group = Group.first(:name => params[:name])
   group.name = params[:group_name]
   group.logo = params[:logo]
   group.color1 = params[:color1]
   group.color2 = params[:color2]
   group.color3 = params[:color3]
   group.color4 = params[:color4]
   group.color5 = params[:color5]
   group.color6 = params[:color6]
   group.updated_at = Time.now
   group.save
   redirect "/#{group.name}/groups/#{group.id}/show"
end
