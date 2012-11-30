# Controller actions for Quiz
get '/quiz/new' do
  erb :quiz_new
end

get '/quiz/:id/show' do
  @quiz = Quiz.get(params[:id])
  erb :quiz_show
end

get '/quizzes/list' do
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

post '/quiz/:id/complete' do
  if logged_in?

    quiz = Quiz.get(params[:id])
    user = @current_user
    level = quiz.level
    # have they already completed the quiz?
    if @current_user.quizs.include? quiz
    else
      user.quizs << quiz
      user.save
      # if they have all the units in the level give them the level
      if (level.units - user.units).empty?
        user.levels << level
        user.save
      end
    end
  end
  # redirect or something here.
end

