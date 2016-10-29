class GoodsController < ApplicationController
  def index
    @goods = Good.all.page(params[:page]).per(10)
  end
end