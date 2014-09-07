Shape.register('red')
Shape.register('yellow')
Shape.register('green')
Shape.register('teal')
Shape.register('blue')
Shape.register('purple')
Shape.register('white')

Drum.register('kick')
Drum.register('snare')
Drum.register('hat')
Drum.register('tom1')
Drum.register('tom2')
Drum.register('tom3')
Drum.register('none')

(1..16).each do |pos|
  Step.register(pos)
end


