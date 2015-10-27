module Payhub
  module Schedule
    class WeeklyValue # :nodoc:
      include Virtus.model
      attribute :weekly_bill_days, Array[String]
    end

    class Weekly
      include Virtus.model
      include Interval

      attribute :schedule_type, String
      attribute :weekly_schedule, WeeklyValue

      # @param [Array<String, Symbol>] days
      # @param [Hash] opts the options create a schedule with.
      # @option opts [Integer] :bill_generation_interval The interval between bills
      def initialize(*days)
        if days.last.kind_of? Hash
          opts = days.pop
          super(opts)
        end
        args = {
          weekly_bill_days: days.map(&:upcase)
        }
        self.schedule_type = 'W'
        self.weekly_schedule = args
      end
    end

  end
end
