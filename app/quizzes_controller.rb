# Controller actions for Quiz
get '/:name/quizzes/new' do
  erb :quiz_new
end

get '/:name/quizzes/:id/show' do
  @quiz = Quiz.get(params[:id])
  erb :quiz_show
end

get '/:name/quizzes/:id/edit' do
  erb :quiz_edit
end

post '/:name/quizzes/create' do
end

post '/:name/quizzes/:id/destroy' do
  @quiz = Quiz.get(params[:id])
end

post '/:name/quizzes/:id/update' do
  @quiz = Quiz.get(params[:id])
end
