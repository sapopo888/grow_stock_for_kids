class Users::ClothesStocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clothes_stock, only: %i[show edit update destroy]

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
      redirect_to users_clothes_stocks_path, notice: t("defaults.flash_message.registered", item: ClothesStock.model_name.human), status: :see_other
    else
      render :new, alert: t("defaults.flash_message.not_registered", item: ClothesStock.model_name.human), status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @clothes_stock.update(clothes_stock_params)
      redirect_to users_clothes_stocks_path, notice: t("defaults.flash_message.updated", item: ClothesStock.model_name.human), status: :see_other
    else
      render :edit, alert: t("defaults.flash_message.not_updated", item: ClothesStock.model_name.human), status: :unprocessable_entity
    end
  end

  def destroy
    @clothes_stock.destroy!
    redirect_to users_clothes_stock_path, notice: t("defaults.flash_message.deleted", item: ClothesStock.model_name.human)
  end

  private

  def set_clothes_stock
    @clothes_stock = current_user.clothes_stock.find(params[:id])
  end

  def clothes_stock_params
    params.require(:clothes_stock).permit(
      :comment,
      :season_id,
      :category_id,
      :size_id,
      :image,
      :image_cache
      ).merge(user_id: current_user.id) # ユーザーに紐付け
  end
end
