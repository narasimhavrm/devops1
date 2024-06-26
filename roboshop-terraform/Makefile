dev:
	@rm -rf .terraform
	@git pull
	@terraform init -backend-config=env-dev/state.tf
	@terraform apply -auto-approve -var-file=env-dev/main.tf

dev-destroy:
	@rm -rf .terraform
	@git pull
	@terraform init -backend-config=env-dev/state.tf
	@terraform destroy -auto-approve -var-file=env-dev/main.tf

prod:
	@rm -rf .terraform
	@git pull
	@terraform init -backend-config=env-prod/state.tf
	@terraform apply -auto-approve -var-file=env-prod/main.tf
