namespace :drums do

  desc 'play the drums, dummy'
  task :play => :environment do
    loop do
      Step.order('position asc').each do |step|
        step.play
        sleep 0.13
      end
    end
  end

end