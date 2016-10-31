class GoodsController < ApplicationController
  before_action :user_login_check, :except => [:index]
  def index
    @goods = Good.includes(:category).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    @good.user = current_user
    @good.save
    redirect_to goods_path
  end

  def show
    @good = Good.includes(:category, :comments).find(params[:id])
    @comments = @good.comments.order("created_at DESC")
  end

  def edit
    @good = Good.find(params[:id])
    @good.status_check
    if @good.user !=current_user
      flash[:alert]="沒有權限"
      redirect_to goods_path
    end
  end

  def update
    @good = Good.find(params[:id])
    if params[:delete_pic]=="1"
      @good.picture=nil
    end
    if params[:status]=="1"
      @good.status_check
    end
    if @good.user == current_user
       @good.update(good_params)
       flash[:notice] = "更新成功"
       redirect_to goods_path
    elsif @good.user != current_user
       flash[:alert]="沒有權限"
       render :action => :edit
    else
       flash[:alert]="更新失敗"
       render :action => :edit
    end
  end

  def destroy
    @good = Good.find(params[:id])
    if @good.user !=current_user
      flash[:alert]="沒有權限"
    else
      @good.destroy
    end
      redirect_to goods_path
  end

  private
  def good_params
    params.require(:good).permit(:name, :description, :area, :type,
                                :status, :picture, :user_id, :category_id)
  end

  def user_login_check
    if current_user == nil
      flash[:alert]="請先登入"
      redirect_to goods_path
    end
  end

end