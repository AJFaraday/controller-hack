class Shape < ActiveRecord::Base

  POS_OPTS = [
    5,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    60,
    65,
    70,
    75,
    80,
    85,
    90,
    95,
    100
  ]

  size_opts = [
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    0.9,
    1
  ]

  cattr_accessor :pd_connect

  def Shape.pd_connect
    return @@pd_connect if @@pd_connect
    @@pd_connect = UDPSocket.new
    @@pd_connect.connect('localhost', 9595)
  end

  def Shape.send_message(message)
    Shape.pd_connect.send("#{message};\n",0)
  end

  def Shape.register(name)
    if Shape.find_by_name(name)
      puts "Shape already exists: #{name}"
    else
      s = Shape.new(
        :name => name,
        :xpos => 50,
        :ypos => 50,
        :size => 0.5
      )
      s.save!
    end
  rescue => er
    puts "Couldn't register shape: #{name}"
    puts er.message
    puts er.backtrace
  end


end