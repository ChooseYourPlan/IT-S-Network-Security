#!/usr/bin/env expect

spawn sftp -P 2222 foo@weissenfels.tech
send "yes"
expect "password:"
send "pass\n"
expect "sftp>"
send "get Slack.apk\n"
expect "sftp>"
send "exit\n"
interact
