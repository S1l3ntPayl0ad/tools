#!/bin/bash

usage() {
	echo 'Print log cleaning commands for specified log'
	echo '-h - This help menu'
	echo '-s - secure'
	echo '-m - messages'
	echo '-a - audit'
}

messages() {
	echo '//messages; '
	echo 'cat /var/log/messages > /dev/shm/.a; cat /dev/shm/.a'
	echo 'egrep -v "<PATTERN>" /dev/shm/.a'
	echo 'egrep -v "<PATTERN>" /dev/shm/.a > /dev/shm/.b'
	echo 'grep "<PATTERN>" /dev/shm/.b'
	echo '//Overwrite file'
	echo 'cat /dev/shm/.b > /var/log/messages'
	echo 'grep "<PATTERN>" /var/log/messages'
	echo '//Clean Up'
	echo 'tail -1 /var/log/messages'
	echo 'touch -t <YYYYMMDDhhmm.ss> /var/log/messages'
	echo 'ls -lisa /var/log/messages'
	echo 'rm -rf /dev/shm/.a /dev/shm/.b'
	echo 'ls -lisa /dev/shm'
}

secure() {
	echo '//secure logs; '
	echo 'cat /var/log/secure > /dev/shm/.a; cat /dev/shm/.a'
        echo 'egrep -v "<PATTERN>" /dev/shm/.a'
        echo 'egrep -v "<PATTERN>" /dev/shm/.a > /dev/shm/.b'
        echo 'grep "<PATTERN>" /dev/shm/.b'
        echo '//Overwrite file'
        echo 'cat /dev/shm/.b > /var/log/secure'
        echo 'grep "<PATTERN>" /var/log/secure'
	echo '//Clean Up'
        echo 'tail -1 /var/log/secure'
        echo 'touch -t <YYYYMMDDhhmm.ss> /var/log/secure'
        echo 'ls -lisa /var/log/secure'
        echo 'rm -rf /dev/shm/.a /dev/shm/.b'
        echo 'ls -lisa /dev/shm'
	
}

audit() {
	echo '//audit logs;' 
        echo 'cat /var/log/audit/audit.log > /dev/shm/.a; cat /dev/shm/.a'
        echo 'egrep -v "<PATTERN>" /dev/shm/.a'
        echo 'egrep -v "<PATTERN>" /dev/shm/.a > /dev/shm/.b'
        echo 'grep "<PATTERN>" /dev/shm/.b'
        echo '//Overwrite file'
        echo 'cat /dev/shm/.b > /var/log/audit/audit.log'
        echo 'grep "<PATTERN>" /var/log/audit/audit.log'
	echo '//Clean up'
        echo 'tail -1 /var/log/audit/audit.log'
        echo 'touch -t <YYYYMMDDhhmm.ss> /var/log/audit/audit.log'
        echo 'ls -lisa /var/log/audit/audit.log'
        echo 'rm -rf /dev/shm/.a /dev/shm/.b'
        echo 'ls -lisa /dev/shm'

}
while getopts "smah" opt; do 
	case "${opt}" in
		s)
			secure
			;;
		a)
			audit
			;;
		m)
			messages
			;;
		h)	
			usage
			;;
		\?)
			echo "Invalid option"
			usage
			;;
	esac
done
