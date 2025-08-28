class Admins::CategoriesController < Admins::BaseController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = Category.all.order(created_at: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_path, notice: "Categoryを作成しました", status: :see_other
    else
      render :new, alert: "Categoryの作成に失敗しました", status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to admins_categories_path, notice: "Categoryを編集しました", status: :see_other
    else
      render :edit, alert: "Categoryの編集に失敗しました", status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!
    redirect_to admins_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
