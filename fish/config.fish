
if test (uname -s) = "Darwin"
  set -x PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/local/bin /usr/sbin /sbin /usr/X11/bin
  set -x MANPATH /usr/local/share/man /usr/X11/man /usr/share/man

end


if test -d ~/bin
  prefix_path ~/bin
end

set gems (gem env gemdir)/gems
#set git_concise_log_format '--pretty=format:%Cblue%h%Creset %cr %Cgreen%an%Creset %s'

if status --is-login
  for p in /usr/bin /usr/local/bin /opt/local/bin /usr/local/mysql/bin /opt/local/lib/postgresql83/bin ~/bin ~/.config/fish/bin 
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

# function fish_prompt -d "Write out the prompt"
#   printf '%s%s@%s%s' (set_color brown) (whoami) (hostname|cut -d . -f 1) (set_color normal) 
# 
#   # Color writeable dirs green, read-only dirs red
#   if test -w "."
#     printf ' %s%s' (set_color green) (prompt_pwd)
#   else
#     printf ' %s%s' (set_color red) (prompt_pwd)
#   end
# 
#   # # Print subversion revision
#   # if test -d ".svn"
#   #   printf ' %s%s@%s' (set_color normal) (set_color blue) (parse_svn_revision)
#   # end
# 
#   # Print git branch
#   if test -d ".git"
#     printf ' %s%s/%s' (set_color normal) (set_color blue) (parse_git_branch)
#   end
#   printf '%s> ' (set_color normal)
# end

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

if test (hostname -s) = 'lucas-parrys-imac'
  prefix_path ~/bin
  prefix_path /opt/local/bin
  prefix_path /usr/local/mysql/bin
  prefix_path ~/.rvm/bin/
  prefix_path ~/.gem/ruby/1.8/bin
  prefix_path ~/.rvm/ruby-1.8.6-p383/bin
  set -x MY_RUBY_HOME /Users/lparry/.rvm/ruby-1.8.6-p383
  set -x GEM_HOME /Users/lparry/.rvm/gems/ruby/1.8.6
  set -x RUBY_VERSION 'ruby 1.8.6'
end
