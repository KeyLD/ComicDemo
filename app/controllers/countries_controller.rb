class CountriesController < ApplicationController

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      flash[:success] = '新增漫画国家成功'
      redirect_to comics_path
    else
      flash[:alert] = '新增失败!，请填写漫画国家名'
      redirect_to new_country_path
    end
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
