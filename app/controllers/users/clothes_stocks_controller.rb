class Users::ClothesStocksController < ApplicationController
  before_action :authenticate_user!

  def new
    @clothes = StockClothes.new
  end

  def create
    @clothes = StockClothes.new(stock_clothes_params)
    if @clothes.save
      redirect_to 
    end
  end
end
