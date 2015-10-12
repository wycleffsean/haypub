module Payhub
  module Schedule
    class MonthlyValue # :nodoc:
      include Virtus.model

      attribute :monthly_type,                        String
      attribute :monthly_each_days,                   Array[Integer]
      attribute :monthly_on_the_day_of_week_in_month, Integer
      attribute :monthly_day_of_week,                 DayInteger

      def initialize(_args)
        type, *args = _args
        self.monthly_type = type
        case type
        when :E
          self.monthly_each_days = range(args, 1..32)
        when :O
          self.monthly_on_the_day_of_week_in_month = range(args[0], 1..5)
          self.monthly_day_of_week = args[1]
        else raise ArgumentError.new('uknown monthly_type')
        end
      end

      private

      def range(val, range)
        unless [val].flatten.all? {|x| range === x }
          raise ArgumentError.new("argument out of range (#{range})")
        end
        val
      end
    end

    class Monthly
      include Virtus.model

      attribute :schedule_type, String
      attribute :monthly_schedule, MonthlyValue

      # :args:
      #   type -> :E | :O
      #   :E args -> 1-32..
      #   :O args -> 1-5, 1-7
      def initialize(*args)
        self.schedule_type = 'M'
        self.monthly_schedule = args
      end
    end

  end
end
