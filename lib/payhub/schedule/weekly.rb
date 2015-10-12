module Payhub
  module Schedule
    class WeeklyValue # :nodoc:
      include Virtus.model
      attribute :weekly_bill_days, Array[String]
    end

    class Weekly
      include Virtus.model

      attribute :schedule_type, String
      attribute :weekly_schedule, WeeklyValue

      # @param [Array<String, Symbol>] days
      def initialize(*days)
        args = {
          weekly_bill_days: days.map(&:upcase)
        }
        self.schedule_type = 'W'
        self.weekly_schedule = args
      end
    end

  end
end
