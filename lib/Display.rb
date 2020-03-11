require 'terminal-table'
require_relative 'Model.rb'
require_relative 'helpers.rb'

require 'tty-font'
require 'colorize'

class Display
    # shows list of completed activities
    def self.show_activities(user)
        activities = Model.get_activities(user)
        rows = []
        activities.each do |a|
            row = [a.type, a.distance, a.duration, a.date]
            if a.completed == true
                row = row.colorize(:green)
            end
            rows << row
        end
        table = Terminal::Table.new :title => "Activity Log", :headings => ['Activity', 'Distance', 'Duration', 'Date'], :rows => rows
        puts table
    end

    def self.display_totals(distance, duration)
        font = TTY::Font.new(:straight)
        rows = [["#{distance}kms", "#{duration}"]]
        table = Terminal::Table.new :title => font.write("Activity Totals").colorize(:cyan), :headings => ['Total Distance', 'Total Time'], :rows => rows
        puts table
    end

    def self.display_records(distance, duration)
        font = TTY::Font.new(:straight)
        rows = [["#{distance}kms", "#{duration}"]]
        table = Terminal::Table.new :title => font.write("Personal Records").colorize(:magenta), :headings => ['Longest Distance', 'Longest Time'], :rows => rows
        puts table
        # puts "Longest Distance: #{distance}"
        # puts "Longest Duration: #{duration}"
    end
end



