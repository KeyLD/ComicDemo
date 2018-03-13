class ThemesController < ApplicationController

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      flash[:success] = '新增漫画类型成功'
      redirect_to comics_path
    else
      flash[:alert] = '新增失败！请填写漫画类型名'
      redirect_to new_theme_path
    end
  end

  private

  def theme_params
    params.require(:theme).permit(:name)
  end
end
