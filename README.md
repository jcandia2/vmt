# VMT
Vehicle Maintenance Tracker

## Dev Dependencies
- RVM (for Mac/Linux only: https://rvm.io/)
- Ruby (https://www.ruby-lang.org/en/)
- Node (https://nodejs.org/en/)
- postgres (https://postgresapp.com/)
- Ruby 2.6.6
- Rails 6.0.3.2

## Getting Started
- Clone repo from source on Github
`https://github.com/jcandia2/vmt.git`

- Change into new app directory.
`cd vmt`

Install Ruby Version Manager (RVM) from rvm.io (install Homebrew if prompted)
- Make sure that appropriate Ruby version and gemfile selected.
- Example: `rvm use 2.6.5@rails6.0.2.1`

Install Postgres.
run: 'gem install pg' and then `bundle install`

Create new PG database called vmt and vmt_test
- This is easily done through the pgAdmin GUI.

Install Yarn
- if prompted run 'yarn install'
- if you don't have yarn installed then run 'brew install yarn' then run 'yarn install'

Run the dev server:
`rails s`

The Bullet gem is included in development to flag N+1 issues. 
To check the log:
`log/bullet.log`
