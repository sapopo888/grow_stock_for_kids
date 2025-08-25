class Admins::SeasonsController < Admins::BaseController
  before_action :set_season, only: %i[edit update destroy]

  def index
    @seasons = Season.all
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      flash[:notice] = '季節を作成しました'
    else
      flash.now[:alert] = '季節の作成に失敗しました'
    end
  end

  def edit; end

  def update
    if @season.update(season_params)
      flash[:notice] = '季節を更新しました'
      redirect_to admins_seasons_path, status: :see_other
    else
      flash.now[:alert] = '季節の更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @season.destroy!
    redirect_to admins_seasons_path, notice: "季節を削除しました"
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:name)
  end
end
