# Using 'latest' tag (flagged by Trivy as bad practice)
FROM ubuntu:latest

# Running as root user (default, flagged if not overridden)
USER root

# Installing packages without version pinning (flagged)
RUN apt-get update && apt-get install -y curl wget

# Copying sensitive files into the image (example secret)
COPY id_rsa /root/.ssh/id_rsa

# Exposing unnecessary privileged port
EXPOSE 22

# Using ADD instead of COPY (flagged)
ADD http://example.com/malware.sh /usr/local/bin/malware.sh

# Running a script without checksum verification
RUN chmod +x /usr/local/bin/malware.sh && /usr/local/bin/malware.sh

# No HEALTHCHECK (flagged as missing)
CMD ["/bin/bash"]
