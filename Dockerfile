FROM ubuntu:22.04

# Install socat to handle the network-to-terminal connection
RUN apt-get update && apt-get install -y socat

# Create a non-root user for security
RUN useradd -m -s /bin/bash ctfplayer
WORKDIR /home/ctfplayer

# Copy your script and the hint file into the container
COPY challenge.sh .
COPY note.txt .

# Set permissions so the player can run the script and read the note
RUN chmod +x challenge.sh
RUN chmod +r note.txt
RUN chown -R ctfplayer:ctfplayer /home/ctfplayer

USER ctfplayer

# Open port 3000 and serve a bash terminal to whoever connects
CMD ["socat", "TCP-LISTEN:3000,reuseaddr,fork", "EXEC:/bin/bash,pty,stderr,setsid,sigint,sane"]
