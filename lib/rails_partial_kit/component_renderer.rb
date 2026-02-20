module RailsPartialKit
  class ComponentRenderer
    def self.render(component_name, locals = {}, context = nil)
      config = ComponentRegistry.get(component_name)
      raise "Component '#{component_name}' not registered" unless config

      new(config, locals, context).render
    end

    def initialize(config, locals, context)
      @config = config
      @locals = locals
      @context = context || ActionController::Base.helpers
    end

    def render
      validate_locals!
      merged_locals = merge_defaults
      @context.render(partial: @config[:partial], locals: merged_locals)
    end

    private

    def validate_locals!
      validator = @config[:validator]
      return unless validator

      if validator.respond_to?(:call)
        validator.call(@locals)
      elsif validator.is_a?(Hash)
        validate_hash_rules(validator)
      end
    end

    def validate_hash_rules(rules)
      required = rules[:required] || []
      required.each do |key|
        raise "Missing required local: #{key}" unless @locals.key?(key)
      end
    end

    def merge_defaults
      defaults = @config[:defaults] || {}
      defaults.merge(@locals)
    end
  end
end
