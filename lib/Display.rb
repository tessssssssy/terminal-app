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
            row = [a.type, a.distance, a.duration, a.date, a.completed]
            if a.completed == 'true'
                row = row.map do |cell|
                    cell.to_s.colorize(:green)
                end
            end
            # if activity is_in_past? and completed == false - colorize red
            if a.completed == false && is_in_past?(a.date)
                row = row.map do |cell|
                    cell.to_s.colorize(:red)
                end
            end
            rows << row
        end
        p rows
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
    end
end


