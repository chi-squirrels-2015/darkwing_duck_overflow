class AnswersController < ApplicationController

  def index
    @answers = Answer.all
    @question = Question.find(params[:question_id])
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def new
    # if current_user
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    # end
  end

  def edit
    # if current_user
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    # end
  end

  def create
    # if current_user
    @answer = Answer.create!(answer_params)
    redirect_to question_answers_path
    # end
  end

  def update
    # if current_user
      @answer = Answer.find(params[:id])

      if @answer.update(answer_params)
        redirect_to question_answers_path
      else
        render 'edit'
      end
    # end
  end

  def destroy
    # if current_user
      @answer = Answer.find(params[:id])
      @answer.destroy

      redirect_to category_answers_path
    # end
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end




