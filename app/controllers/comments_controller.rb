class CommentsController < ApplicationController

  def new_question_comment
    @question = Question.find(params[:question_id])
    @comment = Comment.new

  end

  def create_question_comment
    @question = Question.find(params[:question_id])
    @comment = Comment.new(comment_params)
    @comment.commenter = User.find(current_user.id)
    @comment.commentable_id = @question.id
    @comment.commentable_type = "Question"
    if @comment.save
        redirect_to questions_path(@question)
    else
      render new
    end
  end

  def new_answer_comment
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new
  end

  def create_answer_comment
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new(comment_params)
    @comment.commenter = User.find(current_user.id)
    @comment.commentable_id = @answer.id
    @comment.commentable_type = "Answer"
    if @comment.save
        redirect_to questions_path(@question)
    else
      render new
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end


end
