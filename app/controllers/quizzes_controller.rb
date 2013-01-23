# Controller actions for Quiz
get '/quiz/new' do
  erb :quiz_new
end

get '/quiz/:id/show' do
  @quiz = Quiz.get(params[:id])
  erb :quiz_show
end

get '/quizzes' do
  @quizzes = Quiz.all
  erb :quiz_list
end

get '/quiz/:id/edit' do
  erb :quiz_edit
end

post '/quiz/create' do
end

post '/quiz/:id/destroy' do
  @quiz = Quiz.get(params[:id])
end

post '/quiz/:id/update' do
  @quiz = Quiz.get(params[:id])
end

