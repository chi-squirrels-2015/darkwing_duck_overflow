class AnswersController < ApplicationController

  def answer_params
    params.require(:answer).permit(:content, :vote_count, :user, :question)
  end

  def new
    @answer = Answer.new
  end

  def edit
    if current_user
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    else
      redirect_to new_user_session
    end
  end

  def create
    if current_user
    @answer = Answer.create!(answer_params)
    @question = Question.find(params[:question_id])
    redirect_to question_path(@question)
    end
  end

  def update
      @answer = Answer.find(params[:id])
      @question = Question.find(params[:question_id])

    if current_user = @answer.user
      if @answer.update(answer_params)
        redirect_to question_path(@question)
      else
        render 'edit'
      end
    end
  end

  def destroy
      @answer = Answer.find(params[:id])
      @question = Question.find(params[:question_id])
      
    if current_user = @answer.user
      @answer.destroy
      redirect_to questions_path(@question)
    end
  end

end
