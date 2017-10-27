# docker-ajenti-dev
## About
This is a Docker container that will pull a repo from GitHub, compile the Ajenti 2 plugin, and then run Ajenti 2 in developer mode.
## How To Use
```bash
sudo ./start.sh [github_username] [github_repo]
```
Example:
```bash
sudo ./start.sh ggpwnkthx ajenti-coach
```
## Details
This Docker container builds FROM my docker-ajenti repo. So you'll need to run that one first sot it builds the appropriate dependancies then kill that container.
