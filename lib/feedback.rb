class Feedback
  def initialize(computer_num, user_num)
    @computer_num = computer_num.split('')
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
    computer_num.each_with_index do |value, index|
      if user_num[index] == value
        match.prepend(checked)
      elsif user_num.any? value
        match.append(dot)
      end
    end
    match.join
  end
end