require './config/load.rb'

number = Number.new(3).create

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

def talk(text)
  text.split('').each do |letter|
    sleep(0.02); print letter
  end
end

puts "Disarm bomb!"

puts "\n[0] English"
puts "[1] Portuguese"
print "\nChoose your language: "

lang = gets.chomp

I18n.locale = :pt_br if lang == '1'


talk I18n.t(:ask_to_play)
command = gets.chomp

if command == 'h'
  system('tput cuu1; tput dl1')
  talk I18n.t(:help)

  talk I18n.t(:enter_to_play)
  gets.chomp
end

talk I18n.t(:mission_1)

talk I18n.t(:discovery_code)
puts number.locked

# puts number.reveal


user_num = nil
feedback = nil
1..10.times do
  user_num = InputNumber.new(number).request
  feedback = Feedback.new(number, user_num).call
  puts "| #{user_num} |  #{feedback} |"
  break if number.eq? user_num
end

if number.eq? user_num
  puts "#{I18n.t(:you_win)} #{feedback}"
else
  puts I18n.t(:you_lost)
end