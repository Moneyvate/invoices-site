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

### On Localhost With Vagrant

```
vagrant@precise64:/vagrant$ vagrant up
vagrant@precise64:/vagrant$ cd /vagrant
vagrant@precise64:/vagrant$ ./bin/vagrant-configure-dev
```

Enter your first name, last name and the email address you used when you signed up for Github (needed to properly configure Git on your Vagrant instance) when prompted.

Answer the next set of questions as follows:

```
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n
```

Run Bundler, then configure the Postgresql to work properly with Rails by running:

```
vagrant@precise64:/vagrant$ sudo su postgres
postgres@precise64:/vagrant$ psql template1
psql (9.1.9)
Type "help" for help.

template1=# \i lib/assets/setup.sql
template1=# \q
postgres@precise64:/vagrant$ exit
```

Now that postgresql is fixed to work with Rails, you may now run `rake db:create:all`, followed by `rake db:schema:load`.  Once that's done, go ahead and run `rake db:seed` to seed the database with your first admin user.

Congratulations!  You now have a perfectly running Vagrant instance for Moneyvate Invoices!  You'll only have to *bin/vagrant-configure-dev* once.  To view the site, simply go to **http://localhost:8080** on your host machine.
