# Backup Plan #

My backup configurations

## Config ##

Create a config file located at `~/.[TARGET]rc` for each target that looks something like this

    password = PASSWORD
    cloudfiles_api_key = API_KEY
    mail_password = EMAIL_PASSWORD

## Install ##

    rake install

## Run a backup ##

    rake backup[system_name]

## TODO ##

scheduled cleanup of ~/.backup often
