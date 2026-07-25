FROM ubuntu:22.04

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

# Switch to the secure user
USER ctfplayer

# Start a normal terminal session so the player can explore
CMD ["/bin/bash"]
