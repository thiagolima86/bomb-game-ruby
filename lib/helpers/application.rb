module App
  def self.talk(text, speed=50)
    speed = 1.0 / speed
    text.split('').each do |letter|
      sleep(speed)
      print letter
    end
  end

  def self.title
    puts "
  ☆┌─┐　─┐☆
  　│▒│ /▒/
  　│▒│/▒/
  　│▒ /▒/─┬─┐
  　│▒│▒|▒│▒│
  ┌┴─┴─┐-┘─┘
  │▒┌──┘▒▒▒│
  └┐▒▒▒▒▒▒┌┘
  　└┐▒▒▒▒┌
  "
    puts 'Disarm bomb!'
  end
end

def talk(*args)
  App.talk(*args)
end
