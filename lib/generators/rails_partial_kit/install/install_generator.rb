module RailsPartialKit
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def create_component_helpers_initializer
        template "component_helpers.rb", "config/initializers/rails_partial_kit.rb"
      end

      def show_instructions
        say ""
        say "RailsPartialKit has been installed!"
        say ""
        say "Components will be automatically loaded from app/components/"
        say ""
        say "Create your first component:"
        say "  rails generate rails_partial_kit:component card title"
        say ""
      end
    end
  end
end
