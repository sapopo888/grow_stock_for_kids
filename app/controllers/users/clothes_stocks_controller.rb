module Users
  class ClothesStocksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_clothes_stock, only: %i[show edit update destroy]

    def index
      @kid = current_user.kids.find(params[:kid_id])
      @clothes_stocks = @kid.clothes_stocks.order(created_at: :desc).page(params[:page]).per(12)
    end

    def new
      @kid = current_user.kids.find(params[:kid_id])
      @clothes_stock = ClothesStock.new
      @seasons = Season.all
      @categories = Category.all
      @sizes = Size.all
    end

    def create
      @kid = current_user.kids.find(params[:kid_id])
      @clothes_stock = @kid.clothes_stocks.build(clothes_stock_params)
      if @clothes_stock.save
        flash[:notice] = t("defaults.flash_message.registered", item: ClothesStock.model_name.human)
        redirect_to users_kids_path, status: :see_other
      else
        flash.now[:alert] = t("defaults.flash_message.not_registered", item: ClothesStock.model_name.human)
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit
      @kid = @clothes_stock.kid # shallow: true の時は@clothes_stock経由で@kidを取得
      @seasons = Season.all
      @categories = Category.all
      @sizes = Size.all
    end

    def update
      if @clothes_stock.update(clothes_stock_params)
        redirect_to users_clothes_stock_path, notice: t("defaults.flash_message.updated", item: ClothesStock.model_name.human), status: :see_other
      else
        render :edit, alert: t("defaults.flash_message.not_updated", item: ClothesStock.model_name.human), status: :unprocessable_entity
      end
    end

    def destroy
      kid = @clothes_stock.kid
      @clothes_stock.destroy!
      redirect_to users_kid_clothes_stocks_path(kid), notice: t("defaults.flash_message.deleted", item: ClothesStock.model_name.human)
    end

    private

    def set_clothes_stock
      @clothes_stock = current_user.clothes_stocks.find(params[:id])
    end

    def clothes_stock_params
      params.require(:clothes_stock).permit(
        :kid_id,
        :comment,
        :season_id,
        :category_id,
        :size_id,
        :image,
        :image_cache,
        :remove_image
        )
    end
  end
end
