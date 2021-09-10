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
  puts "\nVocê deve desarmar a bomba digitando um codigo numerico. Esse o número de digitos é informado.
Valores inválidos não são contabilizados. Você tem direito a x tentativas.

A cada tentativa o programa vai dar um feedback atravez de simbolos. 
\n[•] significa que existe esse digito no código, mas que ele está em outra posição. 
[✓] significa que tem 1 digito certo e no lugar.
\n
Você desarma a bomba quando acertar o numero todo. "

  print "\n[Enter] to play: "
  gets.chomp
end

talk "\nA terrorist placed a bomb in a mall in Fortaleza Brazil. You are part of the bomb squad and have been called
in to disarm it. Use your skills to defuse the bomb and save people."

print "\n\nYou need discovery this number: "

puts number.locked
puts number.reveal


user_num = nil
feedback = nil
1..10.times do
  user_num = InputNumber.new(number).request
  feedback = Feedback.new(number, user_num).call
  puts "| #{user_num} |  #{feedback} |"
  break if number.eq? user_num
end


if number.eq? user_num
  puts "\nYou Win! #{feedback}"
else
  puts "\nYou Lost"
end