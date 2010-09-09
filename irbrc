require 'rubygems' rescue nil
require 'wirble'
require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history" 
IRB.conf[:AUTO_INDENT]=true

#load wirble
Wirble.init
Wirble.colorize

def debug_active_record(debug_messages = true) 
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = debug_messages ? Logger::DEBUG : Logger::WARN

  reload!
end

require 'utility_belt'

class Fixnum
  def columnize(width=5)
    self.to_s.ljust width
  end
end

class NilClass
  def columnize(width=25)
    ' '.ljust width
  end
end

class String
  def columnize(width=25)
    if size <= width
      ljust(width)
    else
      part1=part2=(width-3)/2
      part1 += 1 if width%2 == 0
      "#{self[0...part1]}...#{self[-part2...size]}"
    end
  end
end
