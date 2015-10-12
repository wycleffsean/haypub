class DayInteger < Virtus::Attribute
  def coerce(val)
    case val
    when :sun, :sunday
      return 1
    when :mon, :monday
      return 2
    when :tue, :tuesday
      return 3
    when :wed, :wednesday
      return 4
    when :thu, :thursday
      return 5
    when :fri, :friday
      return 6
    when :sat, :saturday
      return 7
    when 1..7
      return val
    end
    raise ArgumentError.new('unknown day')
  end
end
