require 'date'

class Activity
    attr_reader :type, :distance, :duration, :date
    def initialize(type, distance, duration)
        @type = type
        @distance = distance
        @duration = duration
        @date = Date.today
    end
end




