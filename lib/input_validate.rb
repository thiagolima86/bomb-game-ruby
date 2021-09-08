class InputValidate
  def initialize(number, user_num)
    @size = number.size
    @user_num = user_num
  end

  def call
    validate
  end

  def message
    validate unless @message.present?
    @message
  end

  private

  attr_reader :size, :user_num

  def validate
    return false if empty_number?
    return false if size_invalid?
    return false if type_invalid?

    true
  end

  def empty_number?
    if user_num.empty?
      @message = 'Is not permited empty'
      true
    end
  end

  def size_invalid?
    if size != user_num.length
      @message = 'The number size is incorrect'
      true
    end
  end

  def type_invalid?
    if /[^0-9]/.match?(user_num)
      @message = 'The type number is incorrect'
      true
    end
  end  
end
