module Payhub
  module Schedule
    module Interval
      def self.included(klass)
        klass.instance_eval do
          attribute :bill_generation_interval, Integer, default: 1
        end
      end
    end
  end
end
