class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :comment_owner, :only => [:destroy]
  before_filter :assign_current_user_id, :only => [:create, :update]

 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_owner
    @comment = Comment.find(params[:id])
    redirect_to @comment.post, :notice =>"You can only destroy your own comments" unless @comment.user == current_user
  end
  
  def assign_current_user_id
    params[:comment][:user_id] = current_user.id
  end
 
end