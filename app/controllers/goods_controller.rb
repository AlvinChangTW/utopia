class GoodsController < ApplicationController
  def index
    @goods = Good.includes(:category).page(params[:page]).per(10)
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
    @good = Good.includes(:category).find(params[:id])
  end

  private
  def good_params
    params.require(:good).permit(:name, :description, :area, :type,
                                :picture, :user_id, :category_id)
  end

end