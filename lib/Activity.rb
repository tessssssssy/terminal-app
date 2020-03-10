require 'date'

class Activity
    attr_reader :type, :distance, :duration, :date
    def initialize(type, distance, duration, date)
        @type = type
        @distance = distance
        @duration = duration
        @date = date
    end
end




