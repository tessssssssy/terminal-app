require 'terminal-table'
require_relative 'ActivityModel.rb'

class Display
    def self.show_activities
        activities = ActivityModel.get_activities
        rows = []
        activities.each do |a|
            rows << [a.type, a.distance, a.duration, a.date]
            # puts "#{r.name} #{r.location} #{r.cuisine}"
        end
        table = Terminal::Table.new :title => "Activity Log", :headings => ['Activity', 'Distance', 'Duration', 'Date'], :rows => rows
        puts table
    end
end

