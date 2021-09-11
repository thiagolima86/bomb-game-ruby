module Configure
  def self.lang
    puts "\n[0] English \n[1] Português"
    print "\nSelect one language: "

    lang = gets.chomp

    I18n.locale = :pt_br if lang == '1'
    options
  end

  def self.options
    talk I18n.t(:ask_to_play)
    command = gets.chomp
    system('tput cuu1; tput dl1')

    help if command == 'h'
    lang if command == 's'
  end

  def self.help
    talk I18n.t(:help)
    options
  end
end
