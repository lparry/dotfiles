function ssh-agent
  eval (command ssh-agent |head -n2| sed -e "s/;.*//" -e "s/=/ /" -e "s/^/set -g -x /" -e "s/\$/;/")
  env|grep SSH
  ssh-add ~/.ssh/id_rsa
end
