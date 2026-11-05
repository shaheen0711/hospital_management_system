# Hospital Management System

A Ruby on Rails application for managing patients, doctors, appointments,
departments, rooms, beds, and medical records.

## Requirements

- Ruby 3.3.11 (see `.ruby-version`)
- Bundler
- SQLite

## Getting started

From the repository root, install dependencies, prepare the database, and seed
the default admin account:

```sh
bundle install
bin/rails db:prepare
bin/rails db:seed
```

Start the Rails server:

```sh
bin/rails server
```

Open [http://localhost:3000](http://localhost:3000). The login page is at
[http://localhost:3000/users/login](http://localhost:3000/users/login). New
patients can register using the link on that page.

The seed task creates an admin account:

- Username: `shaheen@gmail.com`
- Password: `abc123`

Change the default password before using a deployed or shared instance. Use
test data only; do not enter real patient information into an unapproved
environment.

Uploaded files are stored locally through Active Storage in development.

## Tests

Run the complete test suite:

```sh
bin/rails test
```

The tests cover the health check, login and logout, patient registration,
appointment booking, and appointment validation. These checks do not replace
manual verification of every workflow before deployment.

The CI workflow also runs Brakeman and Bundler Audit:

```sh
bin/brakeman --no-pager
bin/bundler-audit
```
