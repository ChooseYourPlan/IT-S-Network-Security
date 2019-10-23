#!/usr/bin/expect

spawn sftp -P 2222 foo@weissenfels.tech
expect "password:"
send "pass\n"
expect "sftp>"
send "get Slack.apk\n"
expect "sftp>"
send "exit\n"
interact
