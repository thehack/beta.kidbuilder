#!/usr/bin/ruby
require 'rubygems'
require 'action_view'
model = ARGV[0]
model_s = model.pluralize


file = File.open('app/'+model_s.to_s+'_controller.rb', 'w')
file.write("# Controller actions for #{model.capitalize}
get '/:name/#{model_s}/new' do
  erb :#{model}_new
end

get '/:name/#{model_s}/:id/show' do
  @#{model} = #{model.capitalize}.get(params[:id])
  erb :#{model}_show
end

get '/:name/#{model_s}/:id/edit' do
  erb :#{model}_edit
end

post '/:name/#{model_s}/create' do
end

post '/:name/#{model_s}/:id/destroy' do
  @#{model} = #{model.capitalize}.get(params[:id])
end

post '/:name/#{model_s}/:id/update' do
  @#{model} = #{model.capitalize}.get(params[:id])
end
")
file.close