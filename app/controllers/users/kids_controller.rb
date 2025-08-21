class Users::KidsController < ApplicationController
   before_action :authenticate_user!

  def index
    # @kids = current_user.kids.find(params[:id])
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new
    if save?
      flash[:notice] = '登録に成功しました'
      redirect_to kids_path
    else
      flash.now[:alert] = '登録に失敗しました'
      render :new
    end
  end
end
