class Users::KidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @kids = current_user.kid.order(created_at: :asc)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = current_user.kid.build(kid_params)
    if @kid.save
      flash[:notice] =  t("defaults.flash_message.registered", item: Kid.model_name.human)
      redirect_to kids_path, status: :see_other
    else
      flash.now[:alert] = t("defaults.flash_message.not_registered", item: Kid.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kid = current_user.kid.find(params[:id])
  end

  def update
    @kid = current_user.kid.find(params[:id])
    if @kid.update(kid_params)
      flash[:notice] = "登録者情報が更新されました"
      redirect_to kids_path, status: :see_other
    else
      flash.now[:alert] = "登録者情報の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kid = current_user.kid.find(params[:id])
    @kid.destroy!
    redirect_to kids_path, notice: t("defaults.flash_message.deleted", item: Kid.model_name.human)
  end

  private

  def kid_params
    params.require(:kid).permit(:name, :gender)
  end
end
