#!/bin/bash
# 1. Catch the dynamic flag and write it safely to a file
echo "${FLAG:-CTF{DEFAULT_LOCAL_FLAG}}" > /home/ctfplayer/flag.txt

# 2. Destroy the environment variable so players can't cheat by typing 'env'
unset FLAG

# 3. Start a raw TCP listener on port 1337 that serves a bash terminal
exec socat TCP-LISTEN:1337,reuseaddr,fork EXEC:"/bin/bash -i",pty,stderr,sane
