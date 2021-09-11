class InputNumber
  def initialize(number)
    @number = number
  end

  def request
    validates(ask_to_user)
  end

  private

  attr_reader :number

  def validates(user_num)
    validate = InputValidate.new(number, user_num)
    unless validate.call
      validate_message(validate)
      user_num = request
    end
    user_num
  end

  def remove_line
    system('tput cuu1; tput dl1')
  end

  def validate_message(validate)
    print "#{validate.message} [press any key]: "
    gets.chomp
    remove_line
  end

  def ask_to_user
    print I18n.t(:write_number, size: number.size)
    user_num = gets.chomp
    remove_line
    user_num
  end
end
