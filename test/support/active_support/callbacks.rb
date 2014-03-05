module ActiveSupport
  module Callbacks
    class Callback
      attr_accessor :filter

      def initialize(filter)
        @filter = filter
      end
    end
  end
end
