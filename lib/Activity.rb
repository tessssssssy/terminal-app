require 'date'

class Activity
    attr_reader :type, :distance, :duration, :date
    attr_accessor :completed
    def initialize(type, distance, duration, date)
        @type = type
        @distance = distance
        @duration = duration
        @date = date
        @completed = false
    end

    def complete_activity
        @completed = true
    end
end






