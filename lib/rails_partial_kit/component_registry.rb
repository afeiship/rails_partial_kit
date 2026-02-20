module RailsPartialKit
  class ComponentRegistry
    @components = {}

    class << self
      def register(name, config)
        @components[name.to_sym] = config.deep_symbolize_keys
      end

      def get(name)
        @components[name.to_sym]
      end

      def all
        @components
      end

      def clear
        @components = {}
      end

      def registered?(name)
        @components.key?(name.to_sym)
      end
    end
  end
end
