class CommentsController < ApplicationController
  before_action :set_good
  before_action :set_comments

  def create
    @comment = @good.comments.build(comment_params)
    if current_user == nil
      flash[:alert]="請先登入"
      #render "goods/show"
    else  @comment.user = current_user
      if @comment.save
        flash[:notice]="留言成功"
        #render "goods/show"
      else
        flash[:alert]="留言失敗"
        #render "goods/show"
      end
    end
    redirect_to good_path(@good)
  end
  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.update(comment_params)
      flash[:notice]="更新留言成功"
    elsif @comment.user != current_user
      flash[:alert]="沒有權限"
    else
      flash[:alert]="更新留言失敗"
    end
    render "goods/show"
  end
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user !=current_user
      flash[:alert]="沒有權限"
    else
      @comment.destroy
    end
      redirect_to good_path(@good)
  end
  private
  def set_good
    @good = Good.find(params[:good_id])
  end
  def set_comments
    @comments = @good.comments
  end
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end


