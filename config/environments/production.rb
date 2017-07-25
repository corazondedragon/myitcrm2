MyITCRM2::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb


  #exception notifier:
  config.middleware.use ExceptionNotifier,
	:email_prefix => "Error 500",
	:sender_address => %{"Exception Notifier" <noreply@ii-inc.ca>},
	:exception_recipients => %w{andrewdegenhardt@yahoo.ca}

  Time::DATE_FORMATS[:invoice_date] = "%B %d, %Y"

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

   # See everything in the log (default is :info)
#  config.log_level = :info

  # Use a different logger for distributed setups
#  config.logger = SyslogLogger.new

  config.logger = Logger.new("log/production.log", shift_age = 7, shift_size = 1048576)
  #config.logger.level = Logger::INFO

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_assets = true  # this needs to be enabled for running production on local server

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  #config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  #config.active_support.deprecation = :notify

	# Compress JavaScripts and CSS
	  config.assets.compress = true

	  # Don't fallback to assets pipeline if a precompiled asset is missed
	  config.assets.compile = false


	  # Generate digests for assets URLs
	  config.assets.digest = true

	  # Defaults to Rails.root.join("public/assets")
	  # config.assets.manifest = YOUR_PATH

	  # Specifies the header that your server uses for sending files
	  config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
	  #config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

	  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
	  # config.force_ssl = true

	  # See everything in the log (default is :info)
	  # config.log_level = :debug

	  # Prepend all log lines with the following tags
	  # config.log_tags = [ :subdomain, :uuid ]

	  # Use a different logger for distributed setups
	  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

	  # Use a different cache store in production
	  # config.cache_store = :mem_cache_store

	  # Enable serving of images, stylesheets, and JavaScripts from an asset server
	  # config.action_controller.asset_host = "http://assets.example.com"

	  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
	  # config.assets.precompile += %w( search.js )

	  # Disable delivery errors, bad email addresses will be ignored
	  # config.action_mailer.raise_delivery_errors = false

	  # Enable threaded mode
	  # config.threadsafe!

	  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
	  # the I18n.default_locale when a translation can not be found)
	  config.i18n.fallbacks = true

	  # Send deprecation notices to registered listeners
	  config.active_support.deprecation = :notify

	  # Log the query plan for queries taking more than this (works
	  # with SQLite, MySQL, and PostgreSQL)
	  #config.active_record.auto_explain_threshold_in_seconds = 0.5


	#action mailer configuration:
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		address:	'localhost',
		domain:		'westmount',
		enable_starttls_auto:	true }


	# Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
 	# config.assets.precompile += %w( search.js )
	#config.assets.precompile += %w[bootstrap_and_overrides.css jquery.mobile.custom.js jquery.mobile.custom.min.js jquery.mobile.custom.structure.css jquery.mobile.custom.structure.min.css jquery.mobile.custom.theme.css jquery.mobile.custom.theme.min.css]A

 


end
