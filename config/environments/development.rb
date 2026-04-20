require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  config.action_controller.perform_caching = false
  config.cache_store = :memory_store
  config.active_storage.service = :local if config.respond_to?(:active_storage)
  config.action_mailer.raise_delivery_errors = false if config.respond_to?(:action_mailer)
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load if config.respond_to?(:active_record)
  config.active_record.verbose_query_logs = true if config.respond_to?(:active_record)
  config.assets.quiet = true if config.respond_to?(:assets)
end
