# RailsPartialKit Configuration
# This initializer ensures component helpers are available in all views

# Include component helpers in all views
ActiveSupport.on_load(:action_view) do
  include RailsPartialKit::ComponentHelper
end

# Load component definitions from app/components
components_path = Rails.root.join("app", "components", "**", "*.rb")
Dir.glob(components_path).each { |file| load file }
