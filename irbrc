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

def debug_active_record(to_stdio = true) 
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = to_stdio ? Logger::DEBUG : Logger::WARN

  reload!
end

require 'utility_belt'
def regex_methods 
  eval <<HERE
  class Object
    def methods_with_args(regex=nil)
      if (regex == nil)
        methods_without_args
      else
        methods_without_args.reject{ |x| not x.match(regex)}
      end
    end
    alias_method_chain :methods, :args
  end
HERE
end

def methods_not_from_object(obj)
  obj.methods - Object.methods
end
