# Include component helpers in all views
ActiveSupport.on_load(:action_view) do
  include RailsPartialKit::ComponentHelper
end
