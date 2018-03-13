class TypesController < ApplicationController

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      flash[:success] = '新增漫画类型成功'
      redirect_to comics_path
    else
      flash[:alert] = '新增失败！请填写漫画类型名'
      redirect_to new_type_path
    end
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end

end
