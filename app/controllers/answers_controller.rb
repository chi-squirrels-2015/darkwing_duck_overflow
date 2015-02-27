class AnswersController < ApplicationController

  def answer_params
    params.require(:answer).permit(:content, :vote_count, :user, :question)
  end

  def new
    # if current_user
    @answer = Answer.new
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

end




