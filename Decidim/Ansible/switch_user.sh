#!/usr/bin/expect

# Define the username and password
set username "jenkins"
set password "teju1811"

# Spawn a shell and log in as the user
spawn su - $username

# Expect the password prompt
expect "Password:"

# Send the password
send "$password\r"

# Start an interactive shell session
interact