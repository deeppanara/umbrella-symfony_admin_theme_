# Parameters
SHELL         = bash
PROJECT       = strangebuzz
GIT_AUTHOR    = COil
HTTP_PORT     = 8000

# Executables
COMPOSER      = composer
YARN          = yarn

# Executables: vendors
PHP_CS_FIXER  = ./vendor/bin/php-cs-fixer

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Coding standards ——————————————————————————————————————————————————————

lint-php: ## Lint files with php-cs-fixer
	$(PHP_CS_FIXER) fix --allow-risky=yes --dry-run

fix-php: ## Fix files with php-cs-fixer
	$(PHP_CS_FIXER) fix --allow-risky=yes

lint-js: ## Lint file with eslint
	$(YARN) eslint 'Bundle/AdminBundle/assets' 'Bundle/CoreBundle/assets'

fix-js: ## Fix files with eslint
	$(YARN) eslint 'Bundle/AdminBundle/assets' 'Bundle/CoreBundle/assets' --fix