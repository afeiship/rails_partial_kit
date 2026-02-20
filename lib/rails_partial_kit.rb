require "rails_partial_kit/version"
require "rails_partial_kit/engine"
require "rails_partial_kit/railtie"
require "rails_partial_kit/component_registry"
require "rails_partial_kit/component_renderer"
require "rails_partial_kit/component_helper"

module RailsPartialKit
  class Error < StandardError; end
end
