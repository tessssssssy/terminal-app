require_relative 'Activity.rb'

class ActivityModel
    def initialize(activities)
        @activities = []
    end
    def self.add_activity(type, distance, duration)
        @activities << Activity.new(type, distance, duration)
    end
end
