function restart_mysql
  sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop
  sudo /Library/StartupItems/MySQLCOM/MySQLCOM start
end