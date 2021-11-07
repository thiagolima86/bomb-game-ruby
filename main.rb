require './config/load.rb'

App.title

Configure.lang
# Configure.options

talk I18n.t('mission_1.title')
sleep(3)
talk I18n.t('mission_1.description')

number = Number.new(3).create
attempts = 10

talk I18n.t(:discovery_code, attempts: attempts, size: number.size)
puts number.locked

user_num = nil
feedback = nil
1..attempts.times do
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
