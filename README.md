# Website Fitness

Website Fitness is a Rails 7 marketing site for FitnessFormula. The current implementation follows a single-page landing page direction that leads with a clear hero, then moves through outcomes, services, approach, credibility, FAQ, and a strong booking CTA. That option was chosen because it keeps the first release focused on conversion and clarity instead of spreading the message across multiple lower-context pages.

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
5. Visit `http://localhost:3000`.

## Verification

- `bin/rails test`
- `bundle exec rubocop`

## Design rationale

The homepage is intentionally structured as a high-trust, single-scroll marketing experience:

- the hero establishes the audience, offer, and primary call to action immediately
- the following sections reinforce outcomes, services, coaching approach, and Julie's tone
- the final booking section repeats the conversion ask after enough context has been earned

This approach fits an early-stage service business well because it keeps the path to booking obvious while still answering the questions a first-time visitor is likely to have.

## Deployment to a DigitalOcean droplet with Kamal

A production-oriented starter config lives at `config/deploy.yml`. It is intentionally committed with obvious placeholders so no secrets or real infrastructure details live in the repo.

### Before the first deploy

1. Create a DigitalOcean droplet for the Rails app.
2. Create or choose a DigitalOcean Container Registry repository.
3. Point your production DNS name at the droplet.
4. Replace the placeholders in `config/deploy.yml`:
   - `<DROPLET_IP>`
   - `<APP_HOST>`
   - `<DO_REGISTRY_REPOSITORY>`
   - `<DO_REGISTRY_USERNAME>`
   - `<DO_REGISTRY_PASSWORD>`
5. Make sure `RAILS_MASTER_KEY` is available to Kamal at deploy time.

### Typical deploy flow

```bash
bundle exec kamal setup
bundle exec kamal deploy
```

Use `kamal setup` the first time to prepare the host, then `kamal deploy` for normal releases. If you change only app code, the same config can continue to be reused.

## Media handling and replacing placeholder videos

If placeholder videos or imagery are used during development, treat them as temporary stand-ins only.

- Do not hotlink Pexels-hosted placeholder media in production.
- Download, license-review, and re-host the final approved media under infrastructure you control.
- Update the frontend references to point at the production asset URLs after upload.
- Prefer stable HTTPS URLs from your own bucket or CDN so browser playback remains predictable.

A practical production workflow is:

1. export the approved video in web-friendly formats such as MP4
2. upload the file to DigitalOcean Spaces or another production-owned asset host
3. set the file ACL and URL pattern according to your delivery strategy
4. replace the placeholder source URLs in the app with the new production URLs
5. verify playback in a real browser before release

## DigitalOcean Spaces CORS for browser video playback

If videos are served from DigitalOcean Spaces and loaded by the Rails site in the browser, configure bucket CORS so the production site can fetch media cleanly.

### Minimum recommended CORS rule

Allow:

- Origin: `https://<APP_HOST>`
- Methods: `GET`, `HEAD`
- Allowed headers: `*`
- Exposed headers: `ETag`
- Max age: `3600`

### DigitalOcean UI steps

1. Open the Space in DigitalOcean.
2. Go to **Settings**.
3. Find **CORS Configuration**.
4. Add a rule that allows `https://<APP_HOST>` as an origin.
5. Allow `GET` and `HEAD` methods.
6. Allow headers `*`.
7. Expose `ETag`.
8. Save the configuration, then retest playback from the production site.

If you also preview from staging, add the staging origin explicitly instead of using a wide-open wildcard unless you truly need public cross-origin access.

## Notes

- `config/deploy.yml` is a starter template, not a checked-in source of truth for secrets.
- Placeholder media should never be mistaken for a production-ready asset strategy.
- Pexels-hosted media must be replaced with production-hosted assets before launch.
