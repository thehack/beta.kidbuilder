# Controller actions for Group
get '/groups/new' do
  group = Group.create(
   :administrator => @current_user.login,
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
  erb :group_edit
end

post '/groups/create' do
end

post '/:name/groups/:id/destroy' do
  @group = Group.get(params[:id])
end

post '/:name/groups/:id/update' do
  @group = Group.get(params[:id])
end
