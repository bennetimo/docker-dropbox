FROM debian:jessie

MAINTAINER Tim Bennett

# Install Python
RUN \
  apt-get update && \
  apt-get install -y python curl

# Download and extract dropbox
RUN curl -SL https://www.dropbox.com/download?plat=lnx.x86_64 \
	| tar xz

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup the Dropbox CLI
ADD https://www.dropbox.com/download?dl=packages/dropbox.py /bin/dropbox.py
RUN chmod +x /bin/dropbox.py

# Expose the Dropbox directory
VOLUME /root/Dropbox

# Start the Dropbox daemon
CMD /.dropbox-dist/dropboxd
