class Users::KidsController < ApplicationController
   before_action :authenticate_user!

  def index
    @kids = current_user.kid
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

  def select_edit_kid
    @kids = current_user.kid
  end

  def edit
    @kid = current_user.kid.find(params[:id])
  end

  private

  def kid_params
    params.require(:kid).permit(:name, :gender)
  end
end
