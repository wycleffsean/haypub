module Payhub
  module Schedule
    class SpecificDatesValue
      include Virtus.model

      attribute :specific_dates, Array[Date]

      def initialize(dates)
        self.specific_dates = dates
      end
    end

    class SpecificDates
      include Virtus.model

      attribute :schedule_type, String
      attribute :specific_dates_schedule, SpecificDatesValue

      def initialize(*args)
        self.schedule_type = 'S'
        self.specific_dates_schedule = args
      end
    end
  end
end
