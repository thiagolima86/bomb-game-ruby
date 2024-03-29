# frozen_string_literal: true

# Validate numbers inputed
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
    return @message = I18n.t('input_validate.empty_invalid') if user_num.empty?
  end

  def size_invalid?
    return @message = I18n.t('input_validate.size_incorrect') if size != user_num.length
  end

  def type_invalid?
    return @message = I18n.t('input_validate.type_incorrect') if /[^0-9]/.match?(user_num)
  end
end
