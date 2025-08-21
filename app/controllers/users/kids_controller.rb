class Users::KidsController < ApplicationController
   before_action :authenticate_user!

  def index
    @kids = current_user.kid.find(params[:id])
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = current_user.kid.build(kid_params)
    if @kid.save
      flash[:notice] = '登録に成功しました'
      redirect_to kids_path
    else
      flash.now[:alert] = '登録に失敗しました'
      render :new
    end
  end

  private

  def kid_params
    params.require(:kid).permit( :name )
  end
end
