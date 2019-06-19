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
vault-logs: ## view logs on vault
	@docker-compose -p secrets logs
vault-ssh: ## SSH access to Vault
	@docker-compose -p secrets exec vault bash
vault-init: ##vault operator init to initialize the vault server. Take note of the Unseal Keys and the Initial Root Token. Without these, the vault is lost when sealed/locked
	@docker-compose -p secrets exec vault vault operator init -key-shares=1 -key-threshold=1
vault-unseal: #vault operator unseal to unseal/open the vault. Follow the onscreen instructions and use 3 of the five Unseal Keys
	@docker-compose -p secrets exec vault vault operator unseal
