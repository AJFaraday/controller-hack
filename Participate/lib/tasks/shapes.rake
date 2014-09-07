namespace :shapes do

  desc 'Get active shapes and pass them to pd'
  task :pass => :environment do
    loop do
      shapes = Shape.active.where(:passed => [nil, false])
      puts "#{shapes.count} shapes found"
      shapes.each do |shape|
        shape.pass
      end
      sleep 1
    end
  end

  desc 'Gets finished shapes from PD and re-activates them'
  task :activate => :environment do
    loop do
      sock = UDPSocket.new
      sock.bind('127.0.0.1',5959)
      loop do
        begin # emulate blocking recvfrom
          msg = sock.recvfrom_nonblock(100)
          name = msg[0].split(';')[0]
          puts name
          shape = Shape.find_by_name(name)
          shape.update_attribute(:active, false) if shape
        rescue IO::WaitReadable
          IO.select([sock])
          retry
        end

      end
    end
  end


end