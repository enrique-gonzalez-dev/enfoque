require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MIS
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'local_env.yml')
        YAML.load(File.open(env_file)).each do |key, value|
            ENV[key.to_s] = value
        end if File.exists?(env_file)
    end

   # config.action_view.field_error_proc = Proc.new { |html_tag, instance|
    #    "<div class=\"has-error\">#{html_tag}</div>".html_safe }

    config.assets.precompile += %w( *-bundle.js )
    config.assets.precompile += %w( *-bundle.css )

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.paths << Rails.root.join('app', 'assets', 'images')

    # Avoid creation of test files, helpers, stylesheets and coffee scripts
    config.generators do |g|
        # g.template_engine nil #to skip views
        g.test_framework  nil #to skip test framework
        g.assets  false
        g.helper false
        g.stylesheets false
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)

    config.autoload_paths += %W(#{config.root}/lib/crypt)

    # Do not swallow errors in after_commit/after_rollback callbacks.
   # config.active_record.raise_in_transactional_callbacks = true

    config.time_zone = 'Mexico City'
    config.active_record.default_timezone = :local

  end
end
