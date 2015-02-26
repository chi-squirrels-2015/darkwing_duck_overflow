class AnswerController < ApplicationController

  def index
    @answers = Answer.all
    @question = Question.find(params[:question_id])
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.create!(answer_params)
    redirect_to question_answers_path
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      redirect_to question_answers_path
    else
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to category_answers_path
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end




