class ShapesController < ApplicationController

  before_action :get_shape, :only => [:edit, :update]

  def edit
    @shape.randomise
    @shape.active = true
    @shape.passed = false
  end

  def update
    if @shape.update_attributes(shape_params)
      flash[:notice] = 'Shape has been added'
    else
      flash[:error] = 'Something went wrong, oops'
    end
    redirect_to shapes_path
  end

  def reset
    Shape.all.each{|x|x.update_attribute :active, :false}
    Shape.send_message('reset-game 1')
    redirect_to shapes_path
  end

  protected

  def get_shape
    @shape = Shape.find(params[:id])
  end

  def shape_params
    params.require(:shape).permit(:name, :xpos, :ypos, :size, :active,:passed)
  end

end
