class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :comment_owner, :only => [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
  end

  private
  def comment_owner
    @comment = Comment.find(params[:id])
    redirect_to @comment.post, :notice =>"You can only destroy your own comments" unless @comment.user == current_user
  end
  
end