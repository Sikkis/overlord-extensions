# Enable bash logging for all users
echo "" >> /etc/profile
echo "#Record terminal sessions" >> /etc/profile
echo "if [ \"x\$SESSION_RECORD\" = \"x\" ]" >> /etc/profile
echo "then" >> /etc/profile
echo "timestamp=\`date \"+%m-%d-%Y-%H:%M\"\`" >> /etc/profile
echo "output=/var/log/session/session.\$USER.\$\$.\$timestamp" >> /etc/profile
echo "SESSION_RECORD=started" >> /etc/profile
echo "export SESSION_RECORD" >> /etc/profile
echo "script -t -f -q 2>\${output}.timing \$output" >> /etc/profile
echo "exit" >> /etc/profile
echo "fi" >> /etc/profile

mkdir /var/log/session
chmod 777 /var/log/session

# Enable tmux logging for root user
echo "run-shell /opt/tmux-logging/logging.tmux" >> /root/.tmux.conf
#ctrl-shift b + shift p # enable logging
