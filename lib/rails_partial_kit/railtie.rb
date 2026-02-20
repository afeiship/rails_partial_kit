module RailsPartialKit
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      # Load component definitions from app/components
      components_path = Rails.root.join("app", "components", "**", "*.rb")
      Dir.glob(components_path).each { |file| load file } if Dir.exist?(Rails.root.join("app", "components"))
    end

    initializer "rails_partial_kit.action_view" do
      ActiveSupport.on_load(:action_view) do
        include RailsPartialKit::ComponentHelper
      end
    end

    initializer "rails_partial_kit.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        helper RailsPartialKit::ComponentHelper
      end
    end
  end
end
