#!/usr/bin/ruby
require 'rubygems'
require 'action_view'
model = ARGV[0]
model_s = model.pluralize


controller = File.open('app/'+model_s.to_s+'_controller.rb', 'w')
controller.write("# Controller actions for #{model.capitalize}
get '/:name/#{model_s}/new' do
  erb :#{model}_new
end

get '/:name/#{model_s}/:id/show' do
  @#{model} = #{model.capitalize}.get(params[:id])
  erb :#{model}_show
end

get '/:name/#{model_s}/list' do
  @#{model_s} = #{model.capitalize}.all
  erb :#{model}_list
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
controller.close

['_show', '_edit', '_new', '_list'].each do |action|
  view = File.open("views/#{model + action +'.erb'}", "w")
  view.close
end