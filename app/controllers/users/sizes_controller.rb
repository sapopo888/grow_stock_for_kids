class Users::SizesController < Admins::BaseController
  before_action :set_size, only: %i[edit update destroy]

  def index
    @sizes = Size.all.order(created_at: :desc)
  end

  def new
    @size = Size.new
  end

  def create
    @size = Size.new(size_params)
    if @size.save
      redirect_to admins_sizes_path, notice: 'サイズを作成しました', status: :see_other
    else
      render :new, status: :unprocessable_entity, alert: 'サイズの作成に失敗しました'
    end
  end

  def edit
    if @size.update
      redirect_to admins_sizes_path, notice: 'サイズを更新しました', status: :see_other
    else
      render :edit, alert: 'サイズの更新にしっぱっしました', status: :unprocessable_entity
    end
  end

  def destroy
    @size.destroy!
    redirect_to admins_sizes_path, notice: 'サイズを削除しました'
  end

  private

  def set_size
    @size = Size.find(params[:id])
  end

  def size_params
    params.require(:size).permit(:name)
  end
end
