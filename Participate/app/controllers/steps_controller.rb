class StepsController < ApplicationController

  def set
    step=Step.find(params[:id])
    step.drum_id = params[:drum_id]
    step.save
  end

end
