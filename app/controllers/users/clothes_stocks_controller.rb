class Users::ClothesStocksController < ApplicationController
  before_action :authenticate_user!

  def index
    @clothes_stocks = current_user.clothes_stock.order(created_at: :desc)
  end

  def new
    @clothes_stock = ClothesStock.new
    @seasons = Season.all
    @categories = Category.all
    @sizes = Size.all
  end

  def create
    @clothes_stock = ClothesStock.new(clothes_stock_params)
    if @clothes_stock.save
      redirect_to users_clothes_stocks_path, notice: 'ストックを作成しました', status: :see_other
    else 
      render :new, alert: 'ストックの作成に失敗しました', status: :unprocessable_entity
    end
  end

  private

  def clothes_stock_params
    params.require(:clothes_stock).permit(
      :comment,
      :season_id,
      :category_id,
      :size_id
      ).merge(user_id: current_user.id) # ユーザーに紐付け
  end
end
