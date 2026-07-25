#!/bin/bash
# Catch the dynamic flag and write it safely
echo "${FLAG:-CTF{DEFAULT_LOCAL_FLAG}}" > /home/ctfplayer/flag.txt

# Destroy the environment variable for security
unset FLAG

# Serve the challenge script DIRECTLY over the network (no pty/bash required)
exec socat TCP-LISTEN:1337,reuseaddr,fork EXEC:"/home/ctfplayer/challenge.sh",stderr
