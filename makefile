help:	## Help Menu
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
run:	## make run - Run Docker
	@docker-compose -p jenkins up -d --build
stop:	## make stop - stop Docker
	@docker-compose -p jenkins down
clean-data:	## make clean-data - stops and removes containers,networks,volumes, and images
	@docker-compose -p jenkins down -v
jenkins-log:	## make jenkins-log - ports jenkins logs to terminal
	@docker-compose -p jenkins exec master tail -f /var/log/jenkins/jenkins.log
jenkins-password:	## make jenkins-password - outputs jenkins admin password to terminal
	@docker-compose -p jenkins exec master cat /var/jenkins_home/secrets/initialAdminPassword
