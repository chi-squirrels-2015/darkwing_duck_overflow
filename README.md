Darkwing Duck Overflow
======================

*Darkwing Duck Overflow is a Stack Overflow derivative for learning
purposes.  Darkwing Duck Overflow (DDO) is a Dev Bootcamp Phase 3 group
project created by Andrew Irwin, Daniel Hanson, and Shiraz Sherwani.*

### Purpose

DDO was created to test drive the Ruby on Rails application development
process.  Additional technologies are integrated with the Rails platform
in order to rapidly develop a functional web app.  The additional
technologies showcased include Devise, Bootstrap, AJAX, JQuery, and
PostgreSQL.

### Getting Started

DDO is built on Rails 4 with Ruby 2.0.0p353, using the base gem
dependencies as well as the additional additional gems below:

##### Production:
* pg
* bootstrap
* simple_form
* devise

##### Development, Test:
* rspec-rails
* factory_girl_rails
* faker
* capybara

### Configuration

The database for all environments is PostgreSQL.  Be sure the most
recent version of Postgres is installed and configured on your machine
before creating, migrating and seeding the database.

The server can be started with ```rails s``` once the database has been
seeded with the provided seed file.

### Testing

The rspec test suite can be run with the command ```bundle exec rspec spec/``` follwed by the test suite you choose to run.
