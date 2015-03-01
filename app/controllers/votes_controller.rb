class VotesController < ApplicationController

  def question_upvote
    @question = Question.find(params[:question_id])
    @user = current_user
    unless @question.votes.find_by(voter_id: @user.id )
      @question.votes << Vote.create(voter_id: @user.id)
    end
    redirect_to :back
  end

  def question_downvote
    @question = Question.find(params[:question_id])
    @user = current_user
    if @question.votes.find_by(voter_id: @user.id )
      @question.votes.find_by(voter_id: @user.id ).destroy
    end
    redirect_to :back
  end

  def answer_upvote
    @answer = Answer.find(params[:answer_id])
    @user = current_user
    unless @answer.votes.find_by(voter_id: @user.id )
      @answer.votes << Vote.create(voter_id: @user.id)
    end
    redirect_to :back

  end


  def answer_downvote
    @answer = Answer.find(params[:answer_id])
    @user = current_user
    if @answer.votes.find_by(voter_id: @user.id )
      @answer.votes.find_by(voter_id: @user.id ).destroy
    end
    redirect_to :back
  end


end
