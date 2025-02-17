require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module ApiTemplate
  class Application < Rails::Application
    # Configuração dos geradores
    config.generators do |g|
      g.scaffold_controller "scaffold/api/controller"  # Aqui informamos o caminho do gerador
    end

    # Corrigir carregamento das pastas lib
    config.load_defaults 7.2
    config.autoload_paths += Dir[Rails.root.join("lib", "**/")]  # Certificando que subpastas sejam carregadas
    config.eager_load_paths += Dir[Rails.root.join("lib", "**/")]
    config.api_only = true
  end
end
