class ComicsController < ApplicationController

  # load_and_authorize_resource

  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update ]
  before_action :set_comic, only: [:show, :edit, :update, :destroy]

  def index
     @q = Comic.ransack(params[:q])
     @comics = @q.result(distinct: true)
     # @comics = Comic.all

  end

  def show
    @type = Type.find(@comic.type_id).name
    @country = Country.find(@comic.country_id).name
    @theme = Theme.find(@comic.theme_id).name
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    # @comic.image = params[:file]
    # ImageUploader.new.store!(@comic.image)
    if @comic.save
      flash[:success] = '上传成功'
      # need to change image name
      # @comic.image.filename = @comic.id
      redirect_to comics_path
    else
      flash[:alert] = '请填写除简介以外的所有内容'
      redirect_to new_comic_path
    end
  end

  def edit
  end

  def update
    @comic.update(comic_params)
    redirect_to comic_path(@comic)
  end

  def destroy
    @comic.destroy
    redirect_to comics_path
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :time, :introduce, :image, :image_cache, :type_id, :country_id, :theme_id)
  end

  def set_comic
    @comic = Comic.find(params[:id])
  end
end
