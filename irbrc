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
 
require 'utility_belt'
 
class Object
  def search_methods(regex)
    self.methods.select {|m| m =~ regex}
  end
end

def methods_not_from_object(obj)
  obj.methods - Object.methods
end
