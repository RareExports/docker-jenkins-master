# docker-jenkins-master

Utilizing Docker to create a full stack setup of Jenkins master and node. 

# Quick Start Guide

This will get you up and running with some basic jobs and default config.

1. Make sure you have all the pre-reqs installed (Docker for Mac or Docker for Windows)
2. Clone this repository to your local drive
3.  From the project root run the following
	- `make build`
	- `make run`
4. Point your browser to http://localhost

# Rebuilding Jenkins Instance and Not Lose Changes

Upon first run 2 volumes will be created named `jenkins-data` and `jenkins-log`. These hold persistent data. 
If you wish to start from scratch simply run `make clean-data`. 
To note this is not true with yum packages. 

These steps will allow for persistent changes. 
1. `make stop`
2. Include updates
3. `make build`
4. `make run`

# Useful Commands

Connect to Jenkins Master as root
`docker-compose -p jenkins exec -u 0 master /bin/bash` 