class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    # @question.user = current_user
    if @question.save
      redirect_to questions_path(@question)
    else
      render new
    end
  end

  def question_params
    params.require(:question).permit(:title, :content, :vote_count, :user_id)
  end

  def new
    @question = Question.new

  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new()
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to questions_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end
end
