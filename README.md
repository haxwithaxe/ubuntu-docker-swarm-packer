# Description
Packer config for building a base image for playing with Docker Swarm and Terraform.
Based mostly off of [this](https://gist.github.com/summerwind/b73d0f72df98fdb6c76e0f2e9ce3971e) gist.

# Build
Edit the deployment path to fit your environment, then run `./build.sh build`.

# Notes
`cloud.cfg` is not a cloud-config file exactly? It seems to be an ubuntu preseed.cfg alternative. I got it from [here](https://gist.github.com/summerwind/b73d0f72df98fdb6c76e0f2e9ce3971e).
