class ShapesController < ApplicationController

  before_action :get_shape

  def edit
    @shape.randomise
    @shape.active = true
  end

  def update
    if @shape.update_attributes(shape_params)
      flash[:notice] = 'Shape has been added'
    else
      flash[:error] = 'Something went wrong, oops'
    end
    redirect_to '/'
  end

  protected

  def get_shape
    @shape = Shape.find(params[:id])
  end

  def shape_params
    params.require(:shape).permit(:name, :xpos, :ypos, :size, :active)
  end

end
