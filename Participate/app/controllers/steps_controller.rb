class StepsController < ApplicationController

  def set
    step=Step.find(params[:id])
    step.drum_id = params[:drum_id]
    step.save
  end

  def reset
    blank_drum = Drum.find_by_name('none')
    Step.connection.execute("update steps set drum_id = #{blank_drum.id};")
  end

end
