FROM ubuntu:22.04

# Install socat to handle the raw TCP connection
RUN apt-get update && apt-get install -y socat

# Create a non-root user
RUN useradd -m -s /bin/bash ctfplayer
WORKDIR /home/ctfplayer

# Copy all files
COPY challenge.sh .
COPY note.txt .
COPY entrypoint.sh .

# Set execution permissions
RUN chmod +x challenge.sh entrypoint.sh
RUN chmod +r note.txt
RUN chown -R ctfplayer:ctfplayer /home/ctfplayer

# Expose standard TCP port 1337
EXPOSE 1337

USER ctfplayer

# Run the entrypoint
ENTRYPOINT ["./entrypoint.sh"]
