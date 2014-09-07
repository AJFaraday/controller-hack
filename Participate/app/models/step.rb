class Step < ActiveRecord::Base

  belongs_to :drum

  def Step.register(position)
    step = Step.find_by_position(position)
    if step
      step
    else
      Step.create(
        :position => position,
        :drum_id => Drum.find_by_name('none').try(:id)
      )
    end
  end

  cattr_accessor :pd_connect

  def pd_connect
    Shape.pd_connect
  end

  def play
    Shape.send_message("drum #{self.drum.name}")
  end

end
