class GivingsController < ApplicationController
  def index
    @givings = Giving.all.page(params[:page]).per(10)
  end
  def new
    @giving = Giving.new
  end

  def create
    @giving = Giving.new(giving_params)
    @giving.save
    redirect_to givings_path
  end

  private
  def giving_params
    params.require(:giving).permit(:name, :description, :area, :type, :category_id)
  end
end