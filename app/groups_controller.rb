# Controller actions for Group
get '/:name/groups/new' do
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

post '/:name/groups/create' do
end

post '/:name/groups/:id/destroy' do
  @group = Group.get(params[:id])
end

post '/:name/groups/:id/update' do
  @group = Group.get(params[:id])
end
