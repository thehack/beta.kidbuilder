# Controller actions for Quiz
get '/quizzes/new' do
  erb :quiz_new
end

get '/quizzes/:id/show' do
  @quiz = Quiz.get(params[:id])
  erb :quiz_show
end

get '/quizzes/list' do
  @quizzes = Quiz.all
  erb :quiz_list
end

get '/quizzes/:id/edit' do
  erb :quiz_edit
end

post '/quizzes/create' do
end

post '/quizzes/:id/destroy' do
  @quiz = Quiz.get(params[:id])
end

post '/quizzes/:id/update' do
  @quiz = Quiz.get(params[:id])
end
