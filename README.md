Moneyvate Invoices
=============

[![Code Climate](https://codeclimate.com/github/Moneyvate/invoices-site.png)](https://codeclimate.com/github/Moneyvate/invoices-site)

## Requirements

* Ruby 2.0
* Rails 4
* PostgreSQL

## Configuration

### Environment Variables

Create `/config/application.yml` and drop the following into it:

```
# Add application configuration variables here, as shown below.
#
# PUSHER_APP_ID: "2954"
# PUSHER_KEY: 7381a978f7dd7f9a1117
# PUSHER_SECRET: abdc3b896a0ffb85d373
# STRIPE_API_KEY: EdAvEPVEC3LuaTg5Q3z6WbDVqZlcBQ8Z
# STRIPE_PUBLIC_KEY: pk_BRgD57O8fHja9HxduJUszhef6jCyS

# Mail settings
MAIL_DOMAIN: ''
DEV_MAIL_DOMAIN: 'localhost:3000'
DEFAULT_MAIL_FROM: '' # Address that will appear in the From header

# Development database credentials
APP_DATABASE: ''
DEV_DATABASE: ''
DEV_USER: ''
DEV_PASSWORD: ''

# Production database credentials
PRODUCTION_DATABASE: ''
PRODUCTION_USER: ''
PRODUCTION_PASSWORD: ''
PRODUCTION_DATABASE: ''
PRODUCTION_HOST: ''

# Secure secret token
SECRET_TOKEN: '' # Generate a new token with 'rake secret'

# Gmail SMTP settings
DEV_GMAIL_SMTP_USER: ''
DEV_GMAIL_SMTP_PASSWORD: ''
PRODUCTION_GMAIL_SMTP_USER: ''
PRODUCTION_GMAIL_SMPT_PASSWORD: ''
MAILER_DEFAULT_URL: '' # Default URL for the mailer to use in production
```

### Using Pry as Your Console

It's pretty simple.  Just add a new initializer called `pry.rb` and paste in the following code:

```
silence_warnings do
  begin
    require 'pry'
    IRB = Pry
  rescue LoadError
  end
end
```

## Database Creation

Simply run `rake db:create:all` after you have done the configuration step above.

## Database Initialization

After creating the database, simply run `rake db:schema:load` and the database will be initialized.

## Running the Test Suite

Coming soon

## Deploying

Coming soon
