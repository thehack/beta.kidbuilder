get '/:name/quizzes/new' do
  erb :quiz_new
end

get '/:name/quizzes/:id/show' do
  erb :quiz_show
end

get '/:name/quizzes/:id/edit' do
  erb :quiz_edit
end

post '/:name/quizzes/:id/create' do
end

post '/:name/quizzes/:id/destroy' do
end

post '/:name/quizzes/:id/update' do
end

