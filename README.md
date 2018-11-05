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

#Rebuilding Jenkins Instance and Not Lose Changes

Upon first run 2 volumes will be created named `jenkins-data` and `jenkins-log`. These hold persistent data. 
If you wish to start from scratch simply run `make clean-data`. 

These steps will allow for persistent changes.  
1. `make stop`
2. `make clean-images`
3. Make changes required
4. `make build`
5. `make run`