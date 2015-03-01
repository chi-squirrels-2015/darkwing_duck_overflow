class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def create
    if current_user
      @question = Question.new(question_params)
      if @question.save
        redirect_to questions_path(@question)
      else
        render new
      end
    else
      redirect_to questions_path
    end
  end

  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end

  def new
    if current_user
      @question = Question.new
    end
  end

  def edit
    if current_user
      @question = Question.find(params[:id])
    else
      redirect_to questions_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new()
  end

  def update
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.update(question_params)
    else
      redirect_to questions_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.destroy
      redirect_to questions_path
    else
      redirect_to questions_path(@question)
    end
  end
end
