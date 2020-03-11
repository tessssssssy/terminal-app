require 'terminal-table'
require_relative 'Model.rb'

class Display
    # shows list of completed activities
    def self.show_activities(user)
        activities = Model.get_activities(user)
        rows = []
        activities.each do |a|
            rows << [a.type, a.distance, a.duration, a.date]
        end
        table = Terminal::Table.new :title => "Activity Log", :headings => ['Activity', 'Distance', 'Duration', 'Date'], :rows => rows
        puts table
    end

    def self.display_totals(distance, duration)
        puts "Total Distance: #{distance} kms"
        puts "Total Time: #{duration} mins"
    end

    def self.display_records(distance, duration)
        puts "Longest Distance: #{distance}"
        puts "Longest Duration: #{duration}"
    end

end



