class Users::KidsController < ApplicationController
  before_action :authenticate_user!

  def all_stocks
    @q = current_user.clothes_stocks.includes(:kid).ransack(params[:q])
    @clothes_stocks = @q.result(distinct: true).page(params[:page]).per(12).order(created_at: :desc)
  end


  def index
    @kids = current_user.kids.order(created_at: :asc)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = current_user.kids.build(kid_params)
    if @kid.save
      flash[:notice] =  t("defaults.flash_message.registered", item: Kid.model_name.human)
      redirect_to users_kids_path, status: :see_other
    else
      flash.now[:alert] = t("defaults.flash_message.not_registered", item: Kid.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kid = current_user.kids.find(params[:id])
  end

  def update
    @kid = current_user.kids.find(params[:id])
    if @kid.update(kid_params)
      flash[:notice] = t("defaults.flash_message.updated", item: Kid.model_name.human)
      redirect_to users_kids_path, status: :see_other
    else
      flash.now[:alert] = t("defaults.flash_message.not_updated", item: Kid.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kid = current_user.kids.find(params[:id])
    @kid.destroy!
    redirect_to users_kids_path, notice: t("defaults.flash_message.deleted", item: Kid.model_name.human)
  end

  private

  def kid_params
    params.require(:kid).permit(:name, :gender)
  end
end
