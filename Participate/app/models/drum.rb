class Drum < ActiveRecord::Base

  # has_many :steps

  def Drum.register(name)
    drum = Drum.find_by_name(name)
    if drum
      puts "Drum already exists: #{name}"
    else
      Drum.create(:name => name)
    end
  end



end
