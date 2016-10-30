class GoodsController < ApplicationController
  def index
    @goods = Good.all.page(params[:page]).per(10)
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    @good.save
    redirect_to goods_path
  end

  private
  def good_params
    params.require(:good).permit(:name, :description, :area, :type,
                                :picture, :category_id)
  end

end