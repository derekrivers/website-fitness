# Website Fitness

Rails 7 foundation for the Website Fitness project.

## Stack

- Ruby 3.2.2
- Rails 7.1
- SQLite for local development
- Tailwind CSS via `tailwindcss-rails`
- RuboCop via `rubocop-rails-omakase`

## Local setup

1. Install Ruby 3.2.2.
2. Run `bundle install`.
3. Create the database with `bin/rails db:prepare`.
4. Start the app with `bin/dev` or `bin/rails server`.

## Verification

- `bin/rails test`
- `bundle exec rubocop`

## Notes

This repo was bootstrapped as the initial Rails application baseline. Later tickets can extend domain models, pages, and deployment setup.
