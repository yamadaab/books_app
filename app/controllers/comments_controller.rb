# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save

    redirect_to @comment.commentable, notice: "コメントを投稿しました"
  end

  def destroy
    comment =  Comment.find(params[:id])
    comment.destroy
    redirect_to comment.commentable
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end
end
