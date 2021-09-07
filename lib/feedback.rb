class Feedback
  def initialize(number, user_num)
    @computer_num = number.reveal.split('')
    @user_num = user_num.split('')
    @dot = '•'
    @checked = '✓'
  end

  def call
    match_each
  end

  private

  attr_reader :computer_num, :user_num, :dot, :checked

  def match_each
    match = []
    user_num.each_with_index do |value, index|
      if computer_num[index] == value
        match.prepend(checked)
      elsif computer_num.any? value
        match.append(dot)
      end
    end
    match.join
  end
end