module RailsPartialKit
  module ComponentHelper
    # Render a registered component
    #
    # @param name [Symbol, String] The component name
    # @param locals [Hash] Local variables for the partial
    # @return [String] The rendered HTML
    #
    # @example
    #   <%= component :card, title: "Hello", body: "World" %>
    def component(name, locals = {})
      ComponentRenderer.render(name, locals, self)
    end

    # Check if a component is registered
    #
    # @param name [Symbol, String] The component name
    # @return [Boolean]
    def component_registered?(name)
      ComponentRegistry.registered?(name)
    end
  end
end
