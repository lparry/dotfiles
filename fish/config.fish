
if test (uname -s) = "Darwin"
  set -x PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/local/bin /usr/sbin /sbin /usr/X11/bin
  set -x MANPATH /usr/local/share/man /usr/X11/man /usr/share/man

end


if test -d $HOME/bin
  prefix_path $HOME/bin
end

set gems (gem env gemdir)/gems
#set git_concise_log_format '--pretty=format:%Cblue%h%Creset %cr %Cgreen%an%Creset %s'

if status --is-login
  for p in /usr/bin /usr/local/bin /opt/local/bin /usr/local/mysql/bin /opt/local/lib/postgresql83/bin $HOME/bin $HOME/.config/fish/bin 
    if test -d $p
      set PATH $p $PATH
    end
  end
end

set fish_greeting ""
set -x CLICOLOR 1

function parse_git_branch
  sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

set BROWSER open

bind \cr "rake"

function ss -d "Run the script/server"
  script/server
end

function sc -d "Run the Rails console"
  script/console
end

# set -x JAVA_HOME "/usr/"



if test (hostname -s) = 'macbook'
  prefix_path /opt/local/bin/
end

if test (hostname -s) = 'lucas-parrys-imac-2'
  prefix_path $HOME/bin
  prefix_path /opt/local/bin
  prefix_path /usr/local/mysql/bin
  prefix_path $HOME/.rvm/bin/
  prefix_path $HOME/.gem/ruby/1.8/bin
  prefix_path $HOME/.rvm/ruby-1.8.6-p383/bin
  prefix_path $HOME/.rvm/gems/ruby/1.8.6/bin/
  set -x MY_RUBY_HOME /Users/lparry/.rvm/ruby-1.8.6-p383
  set -x GEM_HOME /Users/lparry/.rvm/gems/ruby/1.8.6
  set -x RUBY_VERSION 'ruby 1.8.6'
  cd dev/marketplace
end

set -x TERM xterm-color

