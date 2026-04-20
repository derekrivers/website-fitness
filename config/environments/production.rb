require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.assume_ssl = false
  config.force_ssl = false
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.year.to_i}" }
end
