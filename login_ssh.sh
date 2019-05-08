#!/usr/bin/expect

spawn ssh <usr>@<pc ip>
expect "password:"
send "<password>\r"
set prompt_re {\$ $}
expect -re $prompt_re
send "cd ~/catkin_ws\r"
expect -re $prompt_re
interact
