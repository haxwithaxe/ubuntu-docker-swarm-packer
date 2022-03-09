#!/bin/bash

curl -fsSL https://get.docker.com | bash -

# Install docker-compose
curl \
	-L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
	-o /usr/local/bin/docker-compose
chgrp docker /usr/local/bin/docker-compose
chmod g+x /usr/local/bin/docker-compose

# Install docker-compose bash completion
curl \
	-L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose \
	-o /etc/bash_completion.d/docker-compose
chmod a+r /etc/bash_completion.d/docker-compose
